//
//  WebServicesAPI.swift
//  TheFork
//
//  Created by Oscar on 13/12/21.
//

import Foundation
import Alamofire

public enum ServicesStatus {
    case success(Data)
    case error(Error)
}

typealias ServiceCallback = (ServicesStatus) -> ()

enum RequestMethod {
    case get
    case post
    case put
    case delete
}

extension RequestMethod {
    
    static func mapToHttpMethod(_ method: RequestMethod) -> HTTPMethod {
        switch method {
        case .get:
            return HTTPMethod.get
        case .put:
            return HTTPMethod.put
        case .post:
            return HTTPMethod.post
        case .delete:
            return HTTPMethod.delete
        }
    }
}


class WebServicesAPI {
    static func send(
        requestMethod: RequestMethod,
        url: String,
        parameters: [String: Any]? = nil,
        completion: @escaping ServiceCallback
    ) {
        AF.request(
            url,
            method: RequestMethod.mapToHttpMethod(requestMethod),
            parameters: parameters
        ).responseData { response in
            switch response.result {
            case .success(let data):                
                completion(.success(data))
            case .failure(let error):               
                completion(.error(error))
            }
        }
    }
}
