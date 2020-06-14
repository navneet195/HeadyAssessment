//
//  Ranking.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 11/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation


/// model for post
struct Ranking: Codable {
    let products: [Products]
    let ranking: String?
    
    private enum CodingKeys: String, CodingKey {
        case products = "products"
        case ranking = "ranking"
    }
}
