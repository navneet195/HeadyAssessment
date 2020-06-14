//
//  DPTextSize.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation

import UIKit

/// Helper for calculating size of text
public struct TextSizeHelper {
    private struct CacheEntry: Hashable, Equatable {
        let text: String
        let font: UIFont
        let width: CGFloat
        let insets: UIEdgeInsets

        func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(width)
            hasher.combine(insets.top)
            hasher.combine(insets.left)
            hasher.combine(insets.bottom)
            hasher.combine(insets.right)
        }

        static func ==(lhs: TextSizeHelper.CacheEntry, rhs: TextSizeHelper.CacheEntry) -> Bool {
            return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
        }
    }

    private static var cache: [CacheEntry: CGRect] = [:] {
        didSet {
            assert(Thread.isMainThread)
        }
    }


    /// calculate height of string from width and font.
    ///
    /// - Parameters:
    ///   - text: text value
    ///   - font: text font
    ///   - width: text width
    ///   - insets: text insets if any
    /// - Returns: calculate CGRect for text
    public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = .zero) -> CGRect {
        let key = CacheEntry(text: text, font: font, width: width, insets: insets)
        if let hit = cache[key] {
            return hit
        }

        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: .greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: font]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        bounds.size.width = width
        bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)
        cache[key] = bounds
        return bounds
    }
}

extension String
{

    /// check for string is empty or not
    var isNotEmpty: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }


    /// calculate size from text
    ///
    /// - Parameter font: font type
    /// - Returns: gives size of text
    func size(OfFont font: UIFont)
        -> CGSize
    {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
