//
//  HeaderView.swift
//  TheFork
//
//  Created by Oscar on 28/02/22.
//

import UIKit
import AlamofireImage
import RxSwift

class HeaderViewCell: UICollectionViewCell {
 
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let leftSpacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private lazy var buttonsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private var fotterView: FotterView = FotterView()
    
    private var backButton: UIView = ActionButton()
    
    private var shareButton: UIView = ActionButton(template: .share)
    
    private var likeButton:  UIView = ActionButton(template: .like)
    
    private lazy var actionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [backButton, leftSpacerView, shareButton, likeButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 13
      return stackView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupContainerView()
        setupBackgroundImage()
        setupButtonsContainerView()
        setupButtonsStackView()
        setupFotterView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    func setup(title: String, image: String?, callBack: @escaping () -> ()) {
        if  let imageString = image,
            let url =  URL(string: imageString) {
            backgroundImage.af.setImage(withURL: url)
        }
        fotterView.callBack = callBack
        fotterView.setupLabel(title)
    }
}

private extension HeaderViewCell {
    func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.pinTo(view: self)
    }
    
    func setupBackgroundImage() {
        containerView.addSubview(backgroundImage)
        backgroundImage.pinTo(view: containerView)
    }
    
    func setupButtonsContainerView() {
        containerView.addSubview(buttonsContainerView)
        buttonsContainerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonsContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25).isActive = true
        buttonsContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        buttonsContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    func setupButtonsStackView() {
        buttonsContainerView.addSubview(actionStackView)
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        actionStackView.pinTo(view: buttonsContainerView)
    }
    
    func setupFotterView() {
        fotterView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(fotterView)
        fotterView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        fotterView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        fotterView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
    }
}
