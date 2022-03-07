//
//  SinglePhotoViewCell.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import UIKit

class SinglePhotoViewCell: UICollectionViewCell {
 
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
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupContainerView()
        setupBackgroundImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    func update(image imageString: String?) {
        if  let imageString = imageString,
            let url =  URL(string: imageString) {
            backgroundImage.af.setImage(withURL: url)
        }
    }
}

private extension SinglePhotoViewCell {
    func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.pinTo(view: self)
    }
    
    func setupBackgroundImage() {
        containerView.addSubview(backgroundImage)
        backgroundImage.pinTo(view: containerView)
    }
}
