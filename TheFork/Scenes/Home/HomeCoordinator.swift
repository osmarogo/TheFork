//
//  HomeCoordinator.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import UIKit

struct HomeCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    func showPhotoPcker(picsDiaporama: [String]) {
        PhotoPickerCoordinator(
          navigationController: navigationController,
          picsDiaporama: picsDiaporama
        ).start()
    }
}
