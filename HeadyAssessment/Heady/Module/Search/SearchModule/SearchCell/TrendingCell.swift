//
//  TrendingCell.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
class TrendingCell: UITableViewCell {

    //variable
    var allChildCategory : [Categories]?
    
    // MARK: - Properties
    weak var delegate: SearchActionDelegate?
   
    @IBOutlet weak var trendingScrollView : UIScrollView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        trendingTaglisting()
        // Configure the view for the selected state
    }
    
    // MARK: - Helper Functions
    func trendingTaglisting() {
        let subViews = trendingScrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        let arrCount: Int = Algorithms.shared.responceData?.categories?.count ?? 0
        var xCoord: Int = 15
        let yCoord: Int = 8
        let buffer: Int = 5
        var offset: Int = 0
        
        for item in 0..<arrCount {
            
            offset = offset + 1
            var xbuttonWidth:Int = 0
            let tagName:Categories = (Algorithms.shared.responceData?.categories?[item])!
            
            
            let font = UIFont(name: "Helvetica Neue", size: 14)
            var size:CGSize = tagName.cate_name!.size(withAttributes: [NSAttributedString.Key.font: font!])
            if size.width < 30 && size.width != 0 {
                size.width = 45
            }
            xbuttonWidth = Int((size.width))
            
            let tagButton = UIButton(type: .custom)
            tagButton.frame = CGRect(x: CGFloat(xCoord+5), y: CGFloat(yCoord), width: CGFloat(xbuttonWidth), height: CGFloat(32))
            
            tagButton.layer.borderColor = UIColor.lightGray.cgColor
            tagButton.layer.borderWidth = 0.5
            tagButton.setTitleColor(UIColor.black, for: .normal)
            tagButton.backgroundColor = Constants.Color.primaryColor
            tagButton.setTitle(tagName.cate_name, for: .normal)
            tagButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
            tagButton.addTarget(self, action: #selector(handleTrendingAction), for: .touchUpInside)
            tagButton.layer.cornerRadius = 6
            tagButton.tag = item
            trendingScrollView.addSubview(tagButton)
            
            xCoord = xbuttonWidth + buffer + xCoord
        }
        trendingScrollView.contentSize = CGSize(width: CGFloat((xCoord+100)), height: CGFloat(yCoord))
    }
    
    @objc func handleTrendingAction(sender : UIButton)
    {
        let category:Categories = (Algorithms.shared.responceData?.categories?[sender.tag])!
        self.delegate!.handleTrendingItem(for: category)
    }
}
