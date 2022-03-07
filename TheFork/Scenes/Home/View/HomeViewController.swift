//
//  HomeViewController.swift
//  TheFork
//
//  Created by Oscar on 28/02/22.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    var viewModel = HomeViewModel()
    private var coordinator: HomeCoordinator?
    private let disposeBag = DisposeBag()
    
    private var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(HeaderViewCell.self,
                                    forCellWithReuseIdentifier: HomeSection.Section.header.cellIdentifier())
            collectionView.register(BodyCollectionViewCell.self,
                                    forCellWithReuseIdentifier: HomeSection.Section.body.cellIdentifier())
            collectionView.register(LocationViewCell.self,
                                    forCellWithReuseIdentifier: HomeSection.Section.location.cellIdentifier())
            collectionView.register(BookTableViewCell.self,
                                    forCellWithReuseIdentifier: HomeSection.Section.book.cellIdentifier())
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
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func bind() {
        viewModel.updateUI
        .subscribe(onNext: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.collectionView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        coordinator = HomeCoordinator(navigationController: self.navigationController)
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
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let restaurant = viewModel.restaurant
        switch indexPath.row {
        case HomeSection.Section.header.rawValue:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeSection.Section.header.cellIdentifier(),
                for: indexPath
            ) as! HeaderViewCell
            cell.setup(
                title: "See all \(restaurant?.picsDiaporama.count ?? 0) photos",
                image: restaurant?.picsDiaporama.first) { [weak self] in
                    guard let strongSelf = self,
                          let picsList = restaurant?.picsDiaporama else { return }
                    strongSelf.coordinator?.showPhotoPcker(picsDiaporama: picsList)
                }
            return cell
        case HomeSection.Section.body.rawValue:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeSection.Section.body.cellIdentifier(),
                for: indexPath
            ) as! BodyCollectionViewCell
            cell.setup(restaurant: restaurant)
            return cell
        case HomeSection.Section.location.rawValue:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeSection.Section.location.cellIdentifier(),
                for: indexPath
            ) as! LocationViewCell
            cell.update(location: restaurant?.location)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeSection.Section.book.cellIdentifier(),
                for: indexPath
            ) as! BookTableViewCell
            cell.callBack = {
                print("Book a table callback")
            }
            return cell
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case HomeSection.Section.header.rawValue:
            return CGSize(width: view.frame.width, height: 200)
        case HomeSection.Section.body.rawValue, HomeSection.Section.location.rawValue:
            return CGSize(width: view.frame.width, height: 220)
        default:
            return CGSize(width: view.frame.width, height: 50)
        }
    }
}
