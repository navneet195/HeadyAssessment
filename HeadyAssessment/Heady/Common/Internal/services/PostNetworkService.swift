
//
//  PostNetworkService.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation




typealias UserServiceCompletion = (ResponseModel?, URLResponse?, Error?) -> Void

final class PostNetworkService
{
    private var store : InfoSyncManagerModel
    private var url : String?
    init(appStore: InfoSyncManagerModel) {
        store = appStore
        url = store.networkKeys.baseURL
    }
 
    /// get data from Json given
    ///
    /// - Parameter completionHandler: gives response or error for post
    /// - Returns: gives URLSessionDataTask
    func getAPICallConfigureTask(_ completionHandler: @escaping UserServiceCompletion)
        -> URLSessionDataTask
    {
        let url = URL(string: store.networkKeys.baseURL)
        return store.network.codableTask(with: url!, completionHandler: completionHandler)
    }
}
