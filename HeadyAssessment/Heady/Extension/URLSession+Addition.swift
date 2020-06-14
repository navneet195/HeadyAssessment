
//
//  URLSession+Addition.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//
import Foundation
// MARK: - URLSession response handlers
extension URLSession {
    func codableTask<ResponseModel: Codable>(with url: URL,
                                 completionHandler: @escaping (ResponseModel?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
    {
        return self.dataTask(with: url) { data, response, error in
            guard let dataResponse = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            if let ecommersList = try? JSONDecoder().decode(ResponseModel.self, from: dataResponse) {
                completionHandler(ecommersList , response, nil)
            }
        }
    }
}




