//
//  ButtonExtension.swift
//  TheFork
//
//  Created by Oscar on 28/02/22.
//

import UIKit

enum HeaderButtonTemplate: String {
    case back = "chevron.backward"
    case share = "share"
    case like = "heart"
}

extension UIButton {
    static func createButton(template title: HeaderButtonTemplate = .back) -> UIButton {
        let image = UIImage(systemName: title.rawValue)
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.backgroundColor = .black
        button.alpha = 0.6
        button.tintColor = .white
        button.setImage(image, for: .normal)
        return button
    }
}
