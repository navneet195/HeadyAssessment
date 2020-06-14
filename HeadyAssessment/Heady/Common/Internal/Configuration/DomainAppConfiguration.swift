//
//  DomainAppConfiguration.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation
/// - `DomainAppConfiguration`
/*!
 * An application environments
 */

enum DomainAppConfiguration: String {
    /// dev - will be used for development purpose only
    case dev

    /// qa -  will be used for testing purpose for manual testing
    case qa

    /// uat - User Acceptance Testing
    case uat

    /// prod - production environment
    case prod
}
