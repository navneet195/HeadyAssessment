//
//  Product.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 11/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation

/// model for Products
// MARK: - Products
struct Products: Codable {
    let product_id: Int?
    let product_name: String?
    let date_added: String?
    let variants:[Variants]?
    let tax:Tax?
    let orderCount:Int?
    let viewCount:Int?
    let shares:Int?
    
    enum CodingKeys: String, CodingKey {
       
         case product_id = "id"
         case product_name = "name"
         case date_added = "date_added"
         case variants = "variants"
         case tax = "tax"
         case orderCount = "order_count"
         case viewCount = "view_count"
         case shares = "shares"
        
     }
}

// MARK: - Variants
struct Variants: Codable {
    let id: Int?
    let price: Int?
    let size: Int?
    let color:String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case price = "price"
        case size = "size"
        case color = "color"
    }
    
    
}

// MARK: - Tax
struct Tax: Codable {
    let name: String?
    let value: Float?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}




