//
//  SearchCell.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
class SearchCell: UITableViewCell
{
    // MARK: - Properties
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchTitle: UILabel!
    
    weak var delegate: SearchActionDelegate?
    var itemHistory:SearchHistory?
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func loadProduct(category:Categories, imageName:String, isHistoryShowon:Bool)
    {
        searchTitle.text = category.cate_name
        arrowImage.isHidden = isHistoryShowon
        searchImage.image = UIImage(named: imageName)
        self.selectionStyle = .none
    }
    
    func loadSearchHistroyEvent(itemHistorie:SearchHistory, imageName:String, isHistoryShowon:Bool)
    {
        self.itemHistory = itemHistorie
        searchTitle.text = itemHistorie.itemname
        arrowImage.isHidden = isHistoryShowon
        searchImage.image = UIImage(named: imageName)
        self.selectionStyle = .none
    }
    @IBAction func deleteHistroyAction(_ sender: Any) {
        self.delegate!.handleDeleteHistry(for: self.itemHistory!)
    }
}
