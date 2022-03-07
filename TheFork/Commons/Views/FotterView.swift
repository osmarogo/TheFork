//
//  FotterView.swift
//  TheFork
//
//  Created by Oscar on 3/03/22.
//

import UIKit
import RxSwift
import RxCocoa

class FotterView: UIView {
 
    private lazy var imageView: UIImageView = {
        let image = UIImage(systemName: "chevron.right")
        let view = UIImageView(image: image)
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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
      return stackView
    }()
        
    private let disposeBag = DisposeBag()
    var callBack: () -> () = {}
    
    init() {
        super.init(frame: .zero)
        setupUI()
        bind()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
      self.init()
    }
    
    func setupLabel(_ text: String?) {
        label.text = text
    }
    
    private func setupUI() {
        addSubview(backgroundView)
        backgroundView.pinTo(view: self)
        
        addSubview(stackView)
        stackView.pinTo(view: self, topMargin: 3, leadingMargin: 10, trailingMargin: 10, bottomMargin: 3)
        
        addSubview(button)
        button.pinTo(view: self)
    }
    
    private func  bind() {
        button.rx.tap.subscribe(onNext: { [weak self] value in
            guard let strongSelf = self else { return }
            strongSelf.callBack()
        }).disposed(by: disposeBag)
    }
}
