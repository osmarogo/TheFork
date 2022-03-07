//
//  RestaurantInfoRatingView.swift
//  TheFork
//
//  Created by Oscar on 4/03/22.
//

import UIKit
import XCTest

enum RestaurantInfoRatingTheme {
    case theFork
    case tripAdvisor
}

class RestaurantInfoRatingView: UIView {

    private enum RestaurantInfoRatingImage: String {
        case taLogo = "ta-logo"
        case tfLogo = "tf-logo"
    }

    private let infoImage: RestaurantInfoImage = .cash
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel.regularLabel(size: 15, color: .gray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bubbleContainerView: UIView = {
        let bubbleContainerView = UIView()
        bubbleContainerView.translatesAutoresizingMaskIntoConstraints = false
        bubbleContainerView.backgroundColor = .clear
      return bubbleContainerView
    }()
    
    private lazy var bubbleStackView: UIStackView = {
        let bubbleStackView = UIStackView()
        bubbleStackView.translatesAutoresizingMaskIntoConstraints = false
        bubbleStackView.backgroundColor = .clear
        bubbleStackView.axis = .horizontal
        bubbleStackView.distribution = .fillEqually
        bubbleStackView.spacing = 2
      return bubbleStackView
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15
      return stackView
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel.regularLabel(size: 12, color: .gray)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleStackView, subtitle])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
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
    
    private func setupImageStackView() {
        for _ in 1..<5 {
            let bubbleImageView = UIImageView(image: UIImage(named: "bubble-full"))
            bubbleStackView.addArrangedSubview(bubbleImageView)
        }
        let bubbleImageView = UIImageView(image: UIImage(named: "bubble-empty"))
        bubbleStackView.addArrangedSubview(bubbleImageView)
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(containerStackView)
        bubbleContainerView.addSubview(bubbleStackView)
        bubbleStackView.centerXAnchor.constraint(equalTo: bubbleContainerView.centerXAnchor).isActive = true
        bubbleStackView.centerYAnchor.constraint(equalTo: bubbleContainerView.centerYAnchor).isActive = true
        bubbleStackView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        titleStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    }
    
    func setup(title: String? = nil, subtitle: String?, theme: RestaurantInfoRatingTheme) {
        var image: UIImage?
        switch theme {
        case .theFork:
            self.title.text = title
            bubbleStackView.isHidden = true
            image = UIImage(named: RestaurantInfoRatingImage.tfLogo.rawValue)
            titleStackView.addArrangedSubview(self.iconImageView)
            titleStackView.addArrangedSubview(self.title)
        case .tripAdvisor:
            setupImageStackView()
            bubbleStackView.isHidden = false
            image = UIImage(named: RestaurantInfoRatingImage.taLogo.rawValue)
            titleStackView.addArrangedSubview(self.iconImageView)
            titleStackView.addArrangedSubview(self.bubbleContainerView)
        }
        iconImageView.image = image
        self.subtitle.text = subtitle
    }
}
