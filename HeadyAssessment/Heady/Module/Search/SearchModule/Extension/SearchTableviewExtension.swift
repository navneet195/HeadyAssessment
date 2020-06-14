//
//  SearchTableviewExtension.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
class EmptyCell: UITableViewCell
{
    // MARK: - Properties
    @IBOutlet weak var emptyLabel: UILabel!
}
// MARK: - TableDataSource
@available(iOS 13.0, *)
extension SearchProductsVC: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if searchBarActive
        {
            return 1
        }
        else
        {
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        if searchBarActive
        {
            return (self.searchCategory?.count)!
        }
        else
        {
            switch section {
            case 0:
                return 1
            default:
                if self.historieList.count > 0
                {
                    return self.historieList.count
                }
                else
                {
                    return 1
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch searchBarActive {
        case true:
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.String.cellSearch, for: indexPath) as! SearchCell
            
            let category = self.searchCategory?[indexPath.row]
            cell.loadProduct(category:category!, imageName:Constants.Pref.productImg, isHistoryShowon: true)
            
            return cell
            
            
        default:
            
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.String.cellTrending, for: indexPath) as! TrendingCell
                cell.delegate = self
                cell.selectionStyle = .none
                return cell
            default:
                if (self.historieList.count == 0)
                {
                    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.String.cellEmpty, for: indexPath) as! EmptyCell
                    return cell
                }
                else
                {
                    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.String.cellSearch, for: indexPath) as! SearchCell
                    let history:SearchHistory = historieList[indexPath.row] as! SearchHistory
                    
                    cell.delegate = self
                    cell.loadSearchHistroyEvent(itemHistorie: history, imageName: Constants.Pref.closeImg, isHistoryShowon: false)
                    return cell
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 36))
        let labelHeader = UILabel()
        labelHeader.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width-40, height: headerView.frame.height)
        if searchBarActive {
            labelHeader.frame = CGRect.init(x: 20, y: 15, width: headerView.frame.width-40, height: headerView.frame.height-10)
        }
        
        labelHeader.font = UIFont.systemFont(ofSize: 15)
        
        switch searchBarActive {
        case true:
            labelHeader.textColor = .black
            headerView.layer.borderWidth = 0
            headerView.backgroundColor = .white
            labelHeader.text = Constants.String.suggestedProduct
            
            
        default:
            labelHeader.textColor = .lightGray
            headerView.layer.borderWidth = 0.3
            headerView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
            headerView.backgroundColor = Constants.Color.primaryColor
            
            switch section {
            case 0:
                labelHeader.text = Constants.String.trendingSubCategory
            default:
                labelHeader.text = Constants.String.searchHistory
            }
        }
        headerView.addSubview(labelHeader)
        return headerView
    }
}

// MARK: - TableViewDelegate
@available(iOS 13.0, *)
extension SearchProductsVC: UITableViewDelegate
{
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath)
        -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
        //        let cellModel = posts[indexPath.row]
        //        vc!.viewModel = cellModel
        //        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        if searchBarActive
        {
            // push to project view controller
            let productListVC : ProductListVC =
               self.storyboard?.instantiateViewController(withIdentifier: "ProductListVC") as! ProductListVC
            
            productListVC.searchText =  (self.searchCategory?[indexPath.row].cate_name)!
            self.searchText = (self.searchCategory?[indexPath.row].cate_name)!
            insertItemOnHistory()
            productListVC.searchAllProducts = self.searchCategory?[indexPath.row].cate_products
            self.navigationController?.pushViewController(productListVC, animated: true)
            
        }
        else
        {
            if (self.historieList.count > 0)
            {
                let history:SearchHistory = historieList[indexPath.row] as! SearchHistory
                self.productSearchBar.searchTextField.text = history.itemname
                self.productSearchBar.delegate?.searchBar?(self.productSearchBar, textDidChange: history.itemname!)
                
                self.searchBarActive = true
                self.productSearchBar.searchTextField.becomeFirstResponder()
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
}

