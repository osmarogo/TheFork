//
//  UIViewExtension.swift
//  TheFork
//
//  Created by Oscar on 28/02/22.
//

import UIKit

extension UIView {
    func pinTo(view: UIView,
               safeArea: Bool = false,
               topMargin: CGFloat = 0,
               leadingMargin: CGFloat = 0,
               trailingMargin: CGFloat = 0,
               bottomMargin: CGFloat = 0
    ) {
        let topAnchorGuide = safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
        let leadingAnchorGuide = safeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor
        let trailingAnchorGuide = safeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor
        let bottomAnchorGuide = safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor
        
        self.topAnchor.constraint(equalTo: topAnchorGuide, constant: topMargin).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchorGuide, constant: leadingMargin).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchorGuide, constant: (trailingMargin * -1)).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchorGuide, constant: (bottomMargin *  -1)).isActive = true
    }
}
