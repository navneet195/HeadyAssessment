//
//  Category.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 11/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//


struct ResponseModel : Codable {
    let categories:[Categories]?
    let rankings : [Ranking]?
        
   private enum CodingKeys: String, CodingKey {
          case categories = "categories"
          case rankings = "rankings"
      }
}

/// model for Categories
struct Categories: Codable {
    let cate_id: Int?
    let cate_name: String?
    let cate_products: [Products]?
    let childcategory: [Int]?
    enum CodingKeys: String, CodingKey {
        case cate_id = "id"
        case cate_name = "name"
        case childcategory = "child_categories"
        case cate_products = "products"
    }
}



