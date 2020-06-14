//
//  ProductVariantsView.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 14/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

class ProductVariantsView: UIView {
    @IBOutlet weak var scrollviewColor: UIScrollView!
    @IBOutlet weak var scrollviewSize: UIScrollView!
    @IBOutlet weak var scrollviewTax: UIScrollView!
    
    // Static value set on this screen
    var size = ["28", "36", "40", "42", "44"]
    var tax = ["3", "8", "0", "10", "5"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
        
    }
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ProductVariantsView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        initialize()
    }
    func initialize()
    {
        colorlisting()
        sizelisting()
        taxlisting()
    }
}


extension ProductVariantsView
{
    // MARK: - Helper Functions
    func colorlisting() {
        let subViews = scrollviewColor.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        let arrCount: Int = 5
        var xCoord: Int = 0
        let yCoord: Int = 0
        let buffer: Int = 8
        var offset: Int = 0
        
        if arrCount > 0
        {
            for item in 0..<arrCount {
                
                offset = offset + 1
                let xbuttonWidth:Int = 26
                
                let tagButton = UIButton(type: .custom)
                tagButton.frame = CGRect(x: CGFloat(xCoord+8), y: CGFloat(yCoord), width: CGFloat(xbuttonWidth), height: CGFloat(26))
                tagButton.backgroundColor = UIColor.random()
                tagButton.layer.cornerRadius = 13
                tagButton.tag = item
                scrollviewColor.addSubview(tagButton)
                xCoord = xbuttonWidth + buffer + xCoord
            }
            scrollviewColor.contentSize = CGSize(width: CGFloat((xCoord+60)), height: CGFloat(30))
        }
        
    }
    
    // MARK: - Helper Functions Size
    func sizelisting() {
        let subViews = scrollviewSize.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        let arrCount: Int = size.count
        var xCoord: Int = 0
        let yCoord: Int = 0
        let buffer: Int = 8
        var offset: Int = 0
        
        if arrCount > 0
        {
            for item in 0..<arrCount {
                
                offset = offset + 1
                let xbuttonWidth:Int = 26
                let sizeValue = size[item]
                let tagButton = UIButton(type: .custom)
                tagButton.frame = CGRect(x: CGFloat(xCoord+8), y: CGFloat(yCoord), width: CGFloat(xbuttonWidth), height: CGFloat(26))
                tagButton.backgroundColor = UIColor.gray
                tagButton.setTitle(sizeValue, for: .normal)
                tagButton.layer.cornerRadius = 4
                tagButton.tag = item
                tagButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 11)
                scrollviewSize.addSubview(tagButton)
                xCoord = xbuttonWidth + buffer + xCoord
            }
            scrollviewSize.contentSize = CGSize(width: CGFloat((xCoord+60)), height: CGFloat(30))
        }
    }
    
    // MARK: - Helper Functions Tax
    func taxlisting() {
        let subViews = scrollviewTax.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        let arrCount: Int = tax.count
        var xCoord: Int = 0
        let yCoord: Int = 0
        let buffer: Int = 8
        var offset: Int = 0
        
        if arrCount > 0
        {
            for item in 0..<arrCount {
                
                offset = offset + 1
                let xbuttonWidth:Int = 26
                let taxValue = tax[item]
                let tagButton = UIButton(type: .custom)
                tagButton.frame = CGRect(x: CGFloat(xCoord+8), y: CGFloat(yCoord), width: CGFloat(xbuttonWidth), height: CGFloat(26))
                tagButton.backgroundColor = UIColor.gray
                tagButton.setTitle(taxValue, for: .normal)
                tagButton.layer.cornerRadius = 4
                tagButton.tag = item
                tagButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 11)
                scrollviewTax.addSubview(tagButton)
                xCoord = xbuttonWidth + buffer + xCoord
            }
            scrollviewTax.contentSize = CGSize(width: CGFloat((xCoord+60)), height: CGFloat(30))
        }
    }
    
}
