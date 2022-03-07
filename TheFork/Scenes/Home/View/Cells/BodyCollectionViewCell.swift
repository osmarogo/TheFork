//
//  BodyCollectionViewCell.swift
//  TheFork
//
//  Created by Oscar on 4/03/22.
//

import UIKit

class BodyCollectionViewCell: UICollectionViewCell {
 
    private lazy var title: UILabel = UILabel.boldLabel()

    private lazy var locationView: RestaurantInfoView = RestaurantInfoView()
    
    private lazy var restaurantView: RestaurantInfoView = RestaurantInfoView()
    
    private lazy var cashView: RestaurantInfoView = RestaurantInfoView()

    private lazy var restaurantInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationView, restaurantView, cashView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
      return stackView
    }()
    
    private lazy var restaurantInfoRatingView: RestaurantInfoRatingView = RestaurantInfoRatingView()
    
    private lazy var restaurantInfoReviewsView: RestaurantInfoRatingView = RestaurantInfoRatingView()
    
    private lazy var restaurantInfoReviesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [restaurantInfoRatingView, restaurantInfoReviewsView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .gray
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
      return stackView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupTitle()
        setupInfoStackView()
        setupReviesStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    func setup(restaurant: RetaurantEntitty?) {
        guard let restaurant = restaurant else { return }
        self.title.text = restaurant.name
        self.locationView.setup(text: restaurant.address, image:.location)
        self.restaurantView.setup(text: restaurant.speciality, image: .food)
        self.cashView.setup(text: "Average price $\(restaurant.cardPrice)", image: .cash)
        self.restaurantInfoRatingView.setup(
            title: "\(restaurant.avgRate)/10",
            subtitle: "\(restaurant.rateCount) TheFork Revies",
            theme: .theFork
        )
        self.restaurantInfoReviewsView.setup(
            subtitle: "\(restaurant.tripadvisorRateCount) TripAdvisor reviews",
            theme: .tripAdvisor
        )
    }
}

private extension BodyCollectionViewCell {
    func setupTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        title.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        title.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupInfoStackView() {
        locationView.translatesAutoresizingMaskIntoConstraints = false
        restaurantView.translatesAutoresizingMaskIntoConstraints = false
        cashView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(restaurantInfoStackView)
        restaurantInfoStackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        restaurantInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        restaurantInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        locationView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        restaurantView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cashView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupReviesStackView() {
        restaurantInfoRatingView.translatesAutoresizingMaskIntoConstraints = false
        restaurantInfoReviewsView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(restaurantInfoReviesStackView)
        restaurantInfoReviesStackView.topAnchor.constraint(equalTo: restaurantInfoStackView.bottomAnchor, constant: 0).isActive = true
        restaurantInfoReviesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        restaurantInfoReviesStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        restaurantInfoRatingView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        restaurantInfoReviewsView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
