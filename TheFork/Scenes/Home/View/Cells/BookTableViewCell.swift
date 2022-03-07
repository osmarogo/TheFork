//
//  BookTableViewCell.swift
//  TheFork
//
//  Created by Oscar on 4/03/22.
//

import UIKit
import RxSwift

class BookTableViewCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
      return view
    }()
 
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 12
      return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel.boldLabel(size: 20, color: .white)
        label.text = "Book a table"
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let disposeBag = DisposeBag()
    var callBack: () -> () = {}
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupUI()
        bind()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
}

private extension BookTableViewCell {
    func setupUI() {
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        containerView.pinTo(view: self)
        
        buttonView.addSubview(title)
        buttonView.addSubview(button)
        title.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        button.pinTo(view: buttonView)
        containerView.addSubview(buttonView)
        buttonView.pinTo(view: containerView, leadingMargin: 15 ,trailingMargin: 15)
    }
    
    private func  bind() {
        button.rx.tap.subscribe(onNext: { [weak self] value in
            guard let strongSelf = self else { return }
            strongSelf.callBack()
        }).disposed(by: disposeBag)
    }
}
