//
//  ProductTableViewCell.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProdutTitle: UILabel!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var lblVarient: UILabel!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var viewQty: UIView!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewBackground.setCornerRadius(cornerRadius: 5, borderWidth: 2, borderColor: Constants.Color.primaryColor)
        self.viewRating.setCornerRadius(cornerRadius: 2, borderWidth: 1, borderColor: Constants.Color.primaryColor)
        self.viewRating.setCornerRadius(cornerRadius: 2, borderWidth: 1, borderColor: Constants.Color.primaryColor)
        self.btnAdd.setCornerRadius(cornerRadius: 2)
        self.btnMinus.setCornerRadius(cornerRadius: 2, borderWidth: 1, borderColor: self.btnMinus.titleColor(for: .normal)!)
        self.btnPlus.setCornerRadius(cornerRadius: 2, borderWidth: 1, borderColor: self.btnMinus.titleColor(for: .normal)!)
        self.lblQty.setCornerRadius(cornerRadius: 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
  
}
