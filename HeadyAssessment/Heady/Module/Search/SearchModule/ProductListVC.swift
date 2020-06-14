//
//  ProductListVC.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Rahul Jain. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class ProductListVC: UIViewController {
    @IBOutlet weak var blankView: UIView!
    @IBOutlet var tblProducts :UITableView!
    @IBOutlet var searchProducts: UISearchBar!
    
    var searchAllProducts : [Products]?
    var searchText : String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    @available(iOS 13.0, *)
    func configureUI()
    {
        blankView.isHidden = true
        searchProducts.layer.borderWidth = 1
        searchProducts.layer.borderColor = UIColor.white.cgColor
        searchProducts.searchTextField.backgroundColor = Constants.Color.primaryColor
        tblProducts.separatorStyle = .none
        searchProducts.searchTextField.borderStyle = .none
        searchProducts.searchTextField.layer.borderWidth = 0.5
        searchProducts.searchTextField.layer.borderColor = UIColor.lightGray.cgColor
        searchProducts.searchTextField.placeholder = "Search products"
        
        searchProducts.searchTextField.text = searchText
        self.searchProducts.searchTextField.resignFirstResponder()
    }
   
    @IBAction func btnBackAction(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
  
}
@available(iOS 13.0, *)
// MARK: Tableview datasource
extension ProductListVC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        self.blankView.isHidden = false
        return searchAllProducts?.count ?? 0
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        self.blankView.isHidden = true
        guard let cell = tblProducts.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)as?ProductCell else{return UITableViewCell()}
        
        let product: Products = searchAllProducts![indexPath.row]
        cell.lblProdutTitle.text = product.product_name
        cell.lblBrand.text = ""
        let strVarientUnit = "4"
        let strVarientValue:String = String("5")
        cell.lblVarient.text = strVarientValue + " " + strVarientUnit
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mProductDetailVC = UIStoryboard.init(name: "ProductDetail", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
        let product:Products = searchAllProducts![indexPath.row]
                mProductDetailVC?.product = product
                mProductDetailVC?.relevantProduct = Algorithms.shared.getAllRelevantProduct(product_id: product.product_id, products: searchAllProducts)
        self.navigationController?.pushViewController(mProductDetailVC!, animated: true)
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 132
    }
    
    func dayDifference(from interval : TimeInterval) -> String
    {
        let calendar = Calendar.current
        let date = Date(timeIntervalSince1970: interval)
        let startOfNow = calendar.startOfDay(for: Date())
        let startOfTimeStamp = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.day], from: startOfNow, to: startOfTimeStamp)
        let day = components.day!
        if abs(day) < 2 {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .none
            formatter.doesRelativeDateFormatting = true
            return formatter.string(from: date)
        } else if day > 1 {
            return "In \(day) days"
        } else {
            return "\(-day) days ago"
        }
    }

}
