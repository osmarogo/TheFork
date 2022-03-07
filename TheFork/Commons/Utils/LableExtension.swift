//
//  LableExtension.swift
//  TheFork
//
//  Created by Oscar on 4/03/22.
//

import Foundation
import UIKit

extension UILabel {
    
    static func boldLabel(size: CGFloat = 24, color: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textColor = color
        return label
    }
    
    static func regularLabel(size: CGFloat = 10, color: UIColor = .white) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textColor = color
        return label
    }
}
