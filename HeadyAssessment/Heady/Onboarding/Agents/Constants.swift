//
//  Constants.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation
import UIKit
struct Constants {
    
    struct StoryBoards {
        static let Main : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        static let Search: UIStoryboard = UIStoryboard.init(name: "Search", bundle: nil)
        static let ProductDetail: UIStoryboard = UIStoryboard.init(name: "ProductDetail", bundle: nil)
        
    }
    
    struct Color {
        
        static let dividerLine = UIColor(red: 232.0/255, green: 233.0/255, blue: 234/255, alpha: 0.5)
        
        static let appGrayColor = Common.shared.uicolorFromHex(hexValue: 0x787878, alpha: nil)
        static let appBlueColor = Common.shared.uicolorFromHex(hexValue: 0x3CBEFF, alpha: nil)
        static let appExclusiveYellowColor = Common.shared.uicolorFromHex(hexValue: 0xFFCC00, alpha: nil)
        static let appGoldenColor = Common.shared.uicolorFromHex(hexValue: 0xFFCC00, alpha: nil)
        static let primaryColor = UIColor(red: 232.0/255, green: 233.0/255, blue: 234/255, alpha: 0.5)
    }
    
    //Pref
    struct Pref
    {
        static let closeImg = "ic_close"
        static let productImg = "product_black"
    }
    
    //String
    struct String
    {
        
        static let suggestedProduct = "Suggested Product"
        static let trendingSubCategory = "Sub Category"
        static let searchHistory = "Search History"
        
        static let cellTrending = "TrendingCell"
        static let cellSearch = "SearchCell"
        static let cellEmpty = "EmptyCell"
    }
    
    static let walkthrow_1_image_name = "1x.jpg"
    static let walkthrow_2_image_name = "3x.jpg"
    static let walkthrow_3_image_name = "1x.png"
    
    static let walkthrow_1_title_txt = "Making your first purchase?"
    static let walkthrow_2_title_txt = "Know every detail"
    static let walkthrow_3_title_txt = "Let's start"
    
    static let walkthrow_1_disc_txt = "Enjoy awesome perks on Heady app"
    static let walkthrow_2_disc_txt = "Offers, Sizes & More to make your pick easy"
    static let walkthrow_3_disc_txt = "New and exclusive products and find relevant products"
    
    // Screen Name
    static let gettingStartedPagesVC = "GettingStartedPagesVC"
    static let gettingStartedSliderVC = "GettingStartedSliderVC"
    
}

enum EnumType: String, Codable {
    
    /// - Viewed: viewed
    case viewed = "Most Viewed Products"
    
    /// - ordered: ordered
    case ordered = "Most ShaRed Products"
    
    /// - shared: shared
    case shared = "Most OrdeRed Products"
    
}
