//
//  CategoryView.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 11/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

class CategoryView: UIView {
    
    // MARK: - Properties
    
    // outlet
    @IBOutlet weak var scrollViewCategory: UIScrollView!
    
    // variable
    weak var delegate: UserActionDelegate?
    var selectedIndex : Int = 0
    var selectedCategory : Categories?
    var selectedButton : UIButton?
    
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
        let nib = UINib(nibName: "CategoryView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
}

extension CategoryView
{
    
    func loadCategoryWidget(allData:ResponseModel)
    {
        self.trendingTaglisting(allData:allData)
    }
    
    // MARK: - Helper Functions
    func trendingTaglisting(allData:ResponseModel) {
        let subViews = scrollViewCategory.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        let arrCount: Int = allData.categories?.count ?? 0
        var xCoord: Int = 8
        let yCoord: Int = 5
        let buffer: Int = 5
        var offset: Int = 0
        
        if arrCount > 0
        {
            for item in 0..<arrCount {
                
                offset = offset + 1
                var xbuttonWidth:Int = 0
                let category:Categories = (allData.categories?[item])!
                selectedCategory = category
                let font = UIFont(name: "Helvetica Neue", size: 18)
                var size:CGSize = category.cate_name!.size(withAttributes: [NSAttributedString.Key.font: font!])
                if size.width < 30 && size.width != 0 {
                    size.width = 40
                }
                xbuttonWidth = Int((size.width))
                
                let tagButton = UIButton(type: .custom)
                tagButton.frame = CGRect(x: CGFloat(xCoord+5), y: CGFloat(yCoord), width: CGFloat(xbuttonWidth), height: CGFloat(32))
                
                tagButton.layer.borderColor = UIColor.lightGray.cgColor
                tagButton.layer.borderWidth = 0.5
                tagButton.setTitleColor(.black, for: .normal)
                tagButton.backgroundColor = .white
                tagButton.setTitle(category.cate_name, for: .normal)
                tagButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 14)
                tagButton.addTarget(self, action: #selector(handleTrendingAction), for: .touchUpInside)
                tagButton.layer.cornerRadius = 6
                tagButton.tag = item
                if selectedIndex == item
                {
                    selectedButton = tagButton
                    tagButton.backgroundColor = .red
                    tagButton.setTitleColor(.white, for: .normal)
                    
                }
                scrollViewCategory.addSubview(tagButton)
                
                xCoord = xbuttonWidth + buffer + xCoord
            }
            scrollViewCategory.contentSize = CGSize(width: CGFloat((xCoord+100)), height: CGFloat(50))
        }
        
    }
    
    // Button Action
    @objc func handleTrendingAction(sender : UIButton)
    {
        selectedButton!.backgroundColor = .white
        selectedButton!.setTitleColor(.black, for: .normal)
        sender.backgroundColor = .red
        sender.setTitleColor(UIColor.white, for: .normal)
        selectedButton = sender
        let category:Categories = (Algorithms.shared.responceData?.categories?[sender.tag])!
        self.delegate!.selectedCategory(for: category)
    }
}
