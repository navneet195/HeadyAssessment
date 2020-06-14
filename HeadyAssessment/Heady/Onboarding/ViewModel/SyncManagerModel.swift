//
//  SyncManagerModel.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//
import Foundation
/// This protocol is used for setting up a shared object instead making objects `singleton`.
/// which will hold all the shared resources
/// This can help us in building more testable code while doing unit testing.
protocol InfoSyncManagerModel {
    var network : URLSession { get }
    var appConfig: DomainAppConfiguration { get }
    var networkKeys: RxNetworkKeys { get }
}


struct SyncManagerModel: InfoSyncManagerModel
{
    private(set) var network = URLSession.shared
    private(set) var appConfig: DomainAppConfiguration
    private(set) var networkKeys: RxNetworkKeys

    init(with config: DomainAppConfiguration)
    {
        appConfig = config
        networkKeys = RxNetworkKeys(config: appConfig)
    }
}
