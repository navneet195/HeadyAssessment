//
//  UserActionDelegate.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//
import UIKit

protocol UserActionDelegate: class {
    func heightForCollection(for height: Int)
    func heightForTableview(for height: Int)
    func selectedCategory(for category: Categories)
    func addToFavourite(for product: Products)
    
}
