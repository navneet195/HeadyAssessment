//
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
//import Kingfisher


class SubProductCell: UITableViewCell
{
    //variable
    static let cellReuseIdentifier = "SubProductCell"
    private var child_category: Categories?
    
    //outlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var catenameLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func loadCategoryList(category: Categories,tableView : UITableView,impression : String)
    {
        self.child_category = category
        if let title = category.cate_name
        {
            catenameLabel.text = title
        }
    }
    
    func loadProductList(product: Products,tableView : UITableView,impression : String)
       {
           if let title = product.product_name
           {
               catenameLabel.text = title
           }
       }
}
