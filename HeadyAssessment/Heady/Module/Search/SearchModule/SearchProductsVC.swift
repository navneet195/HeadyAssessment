//
//  SearchProductsVC.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
class SearchProductsVC: UIViewController {
    
    // MARK: - Properties
    lazy var workItem = WorkItem()
    var historieList = [NSManagedObject]()
    var searchCategory : [Categories]?
    @IBOutlet weak var tableViewSearch: UITableView!
    var searchBarActive:Bool = false
    var searchText:String = ""
    var dataSourceForSearchResult:[String]?
    @IBOutlet weak var productSearchBar: UISearchBar!
    @IBAction func backButtonAction(_ sender: Any) {
        
        if (self.searchBarActive)
        {
            self.productSearchBar.delegate?.searchBar?(self.productSearchBar, textDidChange:"")
            self.productSearchBar.searchTextField.text = ""
            self.searchBarActive = false
            self.productSearchBar.searchTextField.resignFirstResponder()
        }
        else
        {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getSearch()
    }
}

@available(iOS 13.0, *)
extension SearchProductsVC
{
    
    // MARK: - Helper Functions
    func configureUI()
    {
        
        productSearchBar.layer.borderWidth = 1
        productSearchBar.layer.borderColor = UIColor.white.cgColor
        
        navigationController?.navigationBar.isHidden = true
        tableViewSearch.separatorStyle = .none
        productSearchBar.searchTextField.backgroundColor = Constants.Color.primaryColor
        productSearchBar.searchTextField.borderStyle = .none
        productSearchBar.searchTextField.layer.borderWidth = 0.5
        productSearchBar.searchTextField.layer.borderColor = UIColor.lightGray.cgColor
        productSearchBar.searchTextField.placeholder = "Search products"
    }
}


@available(iOS 13.0, *)
extension SearchProductsVC
{
    
    /// service call for search 
    func getSearch()
    {
        
        //        self.dataSourceForSearchResult = [String]()
        
        // Featch Historie List
        let delegate = UIApplication.shared.delegate as! AppDelegate
        historieList = delegate.fetchRecordsForEntity("SearchHistory",  inManagedObjectContext: delegate.context)
        tableViewSearch.reloadData()
    }
}

@available(iOS 13.0, *)
extension SearchProductsVC: SearchActionDelegate
{
    
    
    /// for delete tap
    ///
    /// - Parameter histry name : to check for search cell
    func handleDeleteHistry(for item:SearchHistory)
    {
        // delete item
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.context.delete(item)
        self.getSearch()
        tableViewSearch.reloadData()
    }
    
    /// for  add to favourite tap
    ///
    /// - Parameter Trending Item : to check for trending cell
    
    func handleTrendingItem(for item: Categories)
    {
        // push to project view controller
        let productListVC : ProductListVC =
            self.storyboard?.instantiateViewController(withIdentifier: "ProductListVC") as! ProductListVC
        self.searchText = item.cate_name!
        insertItemOnHistory()
        productListVC.searchText = item.cate_name!
        productListVC.searchAllProducts = item.cate_products
        self.navigationController?.pushViewController(productListVC, animated: true)
        
    }
    
    
}



