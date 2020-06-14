
//
//  RxNetworkKeys.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//
import Foundation

/// different network keys
struct RxNetworkKeys
{
    private var appConfig: DomainAppConfiguration

    private(set) var baseURL: String

    init(config: DomainAppConfiguration)
    {
        appConfig = config
        // set base url
        switch config
        {
            
        case .dev:
            baseURL = "https://stark-spire-93433.herokuapp.com/json"
        case .qa:
            baseURL = "https://qa.api.heady.io"
        case .uat:
            baseURL = "https://uat.api.heady.io"
        case .prod:
            baseURL = "https://api.heady.io"
        }
    }
}


