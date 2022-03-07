//
//  ActionButton.swift
//  TheFork
//
//  Created by Oscar on 28/02/22.
//

import UIKit

class ActionButton: UIView {
 
    private lazy var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        view.alpha = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let template: HeaderButtonTemplate
    
    init(template: HeaderButtonTemplate) {
        self.template = template
        super.init(frame: .zero)
        setupUI()
    }
    
    convenience init() {
      self.init(template: .back)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
      self.init()
    }
    
    private func setupUI() {
        addSubview(backgroundView)
        backgroundView.pinTo(view: self)
        
        var image = UIImage(named: template.rawValue)
        
        if case HeaderButtonTemplate.back = template {
            image = UIImage(systemName: template.rawValue)
        }
        
        backgroundImage.image = image
        addSubview(backgroundImage)
        
        backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        backgroundImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
}
