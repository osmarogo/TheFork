//
//  HomeViewModel.swift
//  TheFork
//
//  Created by Oscar on 5/03/22.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewModel {
    private let disposeBag = DisposeBag()
    private let sections: [HomeSection.Section] = [.header, .body, .location, .body]
    
    var restaurant: RetaurantEntitty?
    var updateUI = BehaviorRelay<Void>(value: ())
    
    var numberOfRowInSection: Int {
        sections.count
    }
    
    func viewDidLoad() {
        fetchRestaurants()
    }
   
    private func fetchRestaurants() {
        let restaurants = TheForkAPI().fetchRestaurants().asObservable().share()
        
        restaurants.subscribe(onNext: { [weak self] restaurant in
            guard let strongSelf = self else { return }
            strongSelf.restaurant = restaurant
            strongSelf.updateUI.accept(())
        }).disposed(by: disposeBag)
    }
}
