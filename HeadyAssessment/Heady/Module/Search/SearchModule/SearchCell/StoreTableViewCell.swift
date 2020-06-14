//
//  StoreTableViewCell.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    @IBOutlet var viewBorder: UIView!
    @IBOutlet var imgStore: UIImageView!
    @IBOutlet var lblStoreName: UILabel!
    @IBOutlet var lblLocation: UILabel!
    @IBOutlet var lblStoreStatus: UILabel!
    @IBOutlet var lblStoreTimings: UILabel!
    @IBOutlet var viewRateReview: UIView!
    @IBOutlet var lblRateReview: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureUI() {
        self.viewBorder.setCornerRadius(cornerRadius: 5.0, borderWidth: 1.0, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        self.viewRateReview.setCornerRadius(cornerRadius: 5.0, borderWidth: 1.0, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }
}
