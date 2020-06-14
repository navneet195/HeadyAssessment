//
//  SearchHistory+CoreDataProperties.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.

import Foundation
import CoreData
extension SearchHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchHistory> {
        return NSFetchRequest<SearchHistory>(entityName: "SearchHistory")
    }

    @NSManaged public var itemname: String?
    @NSManaged public var userid: String?
    @NSManaged public var timestamp: Int64

}
