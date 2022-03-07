//
//  TheForkAPI.swift
//  TheFork
//
//  Created by Oscar on 13/12/21.
//

import Foundation
import RxSwift

enum TheForkError: Error {
    case threadNotEmpty
}

class TheForkAPI {
    
    func fetchRestaurants() -> Single<RetaurantEntitty> {
        return .create { single in
            WebServicesAPI.send(requestMethod: .get, url: ServicesDefinition.restaurants) { status in
                switch status {
                case .success(let data):                    
                    if let restaurants = try? RetaurantEntitty.decode(data: data) {
                        single(.success(restaurants))
                    }
                case .error(let error):
                    single(.error(error))
                }
            }       
            return Disposables.create()
        }
    }
}

