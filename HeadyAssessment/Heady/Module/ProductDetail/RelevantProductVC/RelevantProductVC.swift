//
//  RelevantProductVC.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 14/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

class RelevantProductVC: UIView {
    
    //variable
    var allProducts : [Products]?
    weak var delegate: UserActionDelegate?
    //outlet
    @IBOutlet weak var childTableview: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib ()
        return
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
    
}

// MARK:  tableview delegates & data source
extension RelevantProductVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int)
        -> Int
    {
        return self.allProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:SubProductCell.cellReuseIdentifier , for: indexPath) as! SubProductCell
        
        let cellModel = self.allProducts?[indexPath.row]
        cell.loadProductList(product: cellModel!,tableView : tableView , impression: "")
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableViewWillFinishLoading(_ tableView : UITableView)
    {
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            tableView.layoutSubviews()
            tableView.layoutIfNeeded()
            
            var totalViewHeight : CGFloat  = tableView.contentSize.height+tableView.contentInset.bottom+tableView.contentInset.top
            
            self.titleLable.sizeToFit()
            self.titleLable.layoutIfNeeded()
            
            if self.titleLable.isHidden == false {
                totalViewHeight  = totalViewHeight + 40
            }
            self.superview?.setHeightContrainwith(height:totalViewHeight)
            self.delegate?.heightForTableview(for: Int(totalViewHeight)+40)
        })
    }
}

extension RelevantProductVC
{
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "RelevantProductVC", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        
        initialize()
    }
    func initialize(){
        
        self.childTableview.register(UINib(nibName: SubProductCell.cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: SubProductCell.cellReuseIdentifier)
        self.childTableview.register(UINib(nibName: SubProductCell.cellReuseIdentifier, bundle: nil), forCellReuseIdentifier:SubProductCell.cellReuseIdentifier)
        
        childTableview.separatorColor = UIColor.clear
        childTableview.alwaysBounceVertical = false
        /// service call for product data
        apiCallConfigure()
    }
    
    
    /// service call for product data
    func apiCallConfigure()
    {
            childTableview.reloadData()
            self.tableViewWillFinishLoading(childTableview)
    }
}
