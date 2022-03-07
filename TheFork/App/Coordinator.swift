//
//  Coordinator.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func start()
}
