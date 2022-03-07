//
//  RestaurantInfoView.swift
//  TheFork
//
//  Created by Oscar on 4/03/22.
//

import UIKit

enum RestaurantInfoImage: String {
    case cash
    case food
    case location
}

class RestaurantInfoView: UIView {
 
    private let infoImage: RestaurantInfoImage = .cash
    
    private lazy var imageContainerView: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 30).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.backgroundColor = .systemGreen
        view.alpha = 0.8
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel.regularLabel(size: 12, color: .gray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageContainerView, label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
      return stackView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        addSubview(containerStackView)
        imageContainerView.addSubview(iconImage)
        iconImage.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        containerStackView.pinTo(view: self, leadingMargin: 15, trailingMargin: 15)
    }
    
    func setup(text: String?, image: RestaurantInfoImage = .cash) {
        let backgourndImage = UIImage(named: image.rawValue)
        iconImage.image = backgourndImage
        label.text = text
    }
}
