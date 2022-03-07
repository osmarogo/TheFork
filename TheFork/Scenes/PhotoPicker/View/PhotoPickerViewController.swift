//
//  PhotoPickerViewController.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import UIKit
import RxSwift

class PhotoPickerViewController: UIViewController {

    var viewModel = PhotoPickerViewModel()
    
    private let disposeBag = DisposeBag()
    
    private var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(SinglePhotoViewCell.self,
                                    forCellWithReuseIdentifier: PickerPhotoSection.Section.pickerPhoto.cellIdentifier()
            )
            collectionView.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        bind()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func bind() {
        viewModel.updateUI
        .subscribe(onNext: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.collectionView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func setupView() {
        title = viewModel.title
        view.backgroundColor = .white
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let frameLayoutGuide = collectionView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
          frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate
extension PhotoPickerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

// MARK: - UICollectionViewDataSource
extension PhotoPickerViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoString = viewModel.photoString(at: indexPath.row)
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PickerPhotoSection.Section.pickerPhoto.cellIdentifier(),
            for: indexPath
        ) as! SinglePhotoViewCell
        cell.update(image: photoString)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension PhotoPickerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

