//
//  PhotoPickerCoordinator.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import UIKit

class PhotoPickerCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    private var picsDiaporama: [String]
    
    init(navigationController: UINavigationController?, picsDiaporama: [String]) {
        self.navigationController = navigationController
        self.picsDiaporama = picsDiaporama
    }
    
    func start() {
        let photoPickerViewController = PhotoPickerViewController()
        photoPickerViewController.viewModel.picsDiaporama = picsDiaporama
        navigationController?.pushViewController(photoPickerViewController, animated: false)
    }
}
