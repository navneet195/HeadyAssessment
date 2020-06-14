//
//  SearchBarExtension.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
import CoreData
// MARK: - SearchBarDelegate
@available(iOS 13.0, *)
extension SearchProductsVC: UISearchBarDelegate
{
   
    // MARK: Search
    func filterContentForSearchText(searchText:String) -> [Categories] {
        let filteredArray:[Categories] = (Algorithms.shared.responceData?.categories?.filter({($0.cate_name!.localizedCaseInsensitiveContains(searchText))}))!
        
        return filteredArray
//        self.dataSourceForSearchResult = self.dataSource?.filter({ (text:String) -> Bool in
//            return text.contains(searchText)
//        })
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 0 {
            
            self.searchText = searchText
            self.searchBarActive = true
            // 0.2 == second
            workItem.perform(after: 0.2) {
               //Have Stopped, do something.
                self.searchCategory = self.filterContentForSearchText(searchText: searchText)
                self.tableViewSearch.reloadData()
            }
            
        }else{
            self.searchBarActive = false
            self.getSearch()
            tableViewSearch.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self .cancelSearching()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        insertItemOnHistory()
        self.view.endEditing(true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.productSearchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      //  self.searchBarActive = false
        self.productSearchBar.setShowsCancelButton(false, animated: false)
    }
    func cancelSearching(){
        self.searchBarActive = false
        self.productSearchBar.resignFirstResponder()
        self.productSearchBar.text = ""
        self.getSearch()
        tableViewSearch.reloadData()
    }
    
    func insertItemOnHistory()
    {
        
        // current date and time
        let someDate = Date()

        // time interval since 1970
        let timeStamp = someDate.timeIntervalSince1970
        
        
        // Featch SearchHistory List
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let historie = delegate.fetchRecordsForEntity("SearchHistory",  inManagedObjectContext: delegate.context)
    
        
        if (historie.count > 9)
        {
            // delete first object
            if let result = historie.first {
                delegate.context.delete(result)
            }
        
            // insert new item
            delegate.insertRecored(itemname: self.searchText, timestamp: Int64(timeStamp))
            delegate.saveContext()
            
        }
        else
        {
            // insert new item
            delegate.insertRecored(itemname: self.searchText, timestamp: Int64(timeStamp))
            delegate.saveContext()
        }
    }
}


class WorkItem {
    
    private var pendingRequestWorkItem: DispatchWorkItem?
    
    func perform(after: TimeInterval, _ block: @escaping () -> Void) {
        // Cancel the currently pending item
        pendingRequestWorkItem?.cancel()
        
        // Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem(block: block)
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + after, execute: requestWorkItem)
    }
}
