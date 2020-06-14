//
//  Algorithms.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 13/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation
class Algorithms {
    
    static let shared = Algorithms()
    var responceData : ResponseModel?

    
    // MARK: - Preference - Releavnt product list
    func getAllRelevantProduct(product_id:Int?, products:[Products]?) -> [Products] {

        let getReleaventProduct = (products?.filter {$0.product_id! != product_id})!
        return getReleaventProduct
    }
    
    
    // MARK: - Preference - all products fetch
    func allProducts(response:ResponseModel?) -> [Products] {
        
        var products:[Products] = [Products]()
        for i in 0..<(response?.categories!.count)! {
            let category = response?.categories![i].cate_products
            for j in 0..<category!.count {
                let aProduct:Products = category![j]
                products.append(aProduct)
            }
        }
        return products
    }
    
    // MARK: - Preference - all Child Category fetch
    func allChildCategory(response : ResponseModel?) -> [Categories] {
        
        var childCategorylist : [Categories]  =  [Categories]()
        for i in 0..<(response?.categories!.count)! {
            let childcategory = response?.categories![i].childcategory
            
            for j in 0..<childcategory!.count {
                
                if let childcategoryId: Int = childcategory?[j]
                {
                    for j in 0..<(response?.categories!.count)! {
                        if let category = response?.categories![j], category.cate_id ==  childcategoryId
                        {
                            childCategorylist.append(category)
                        }
                    }
                }
                
            }
        }
        return childCategorylist
    }
    
    // MARK: - Preference - single Child Category fetch
    func childCategory(item:Int) -> [Categories] {
        var childCategorylist : [Categories]?
        let childcategory = responceData?.categories![item].childcategory
        for j in 0..<childcategory!.count {
            
            if let childcategoryId: Int = childcategory?[j]
            {
                for j in 0..<(responceData?.categories!.count)! {
                    if let category = responceData?.categories![j], category.cate_id ==  childcategoryId
                    {
                        childCategorylist?.append(category)
                    }
                }
            }
        }
        return childCategorylist!
    }
    
    
 
    
    // MARK: - Preference - single product fetch
    func getAllProductBaseCategory(item:Int?) -> [Products] {
        let product:[Products] = (responceData?.categories?[item ?? 0].cate_products)!
        return product
    }
    
    /// - Viewed: viewed   Most Viewed Products

    // MARK: - Preference - single Child Category fetch
//       func mostViewedProducts(item:Int) -> [Products] {
//           var mostViewedProducts : [Products]?
//
//
//        for i in 0..<(responceData?.rankings!.count)! {
//            let rankingProducts = responceData?.rankings![i].products
//
//            for j in 0..<rankingProducts!.count {
//
//                if let rankingProductsId: Products = rankingProducts?[j], rankingP
//                {
//                    for j in 0..<(responceData?.categories!.count)! {
//                        if let category = responceData?.categories![j], category.cate_id ==  childcategoryId
//                        {
//                            childCategorylist?.append(category)
//                        }
//                    }
//                }
//
//            }
//        }
//           return mostViewedProducts!
//       }
    
    
       /// - ordered: ordered   Most ShaRed Products
      

       /// - shared: shared  Most OrdeRed Products
      
    
    
}

