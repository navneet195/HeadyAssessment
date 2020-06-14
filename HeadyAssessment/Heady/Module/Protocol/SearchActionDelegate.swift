//
//  SearchActionDelegate.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation
protocol SearchActionDelegate: class {
    func handleDeleteHistry(for item:SearchHistory)
    func handleTrendingItem(for item: Categories)
}
