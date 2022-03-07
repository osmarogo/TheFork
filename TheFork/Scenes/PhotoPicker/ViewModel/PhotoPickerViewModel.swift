//
//  PhotoPickerViewModel.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import Foundation
import RxSwift
import RxRelay

class PhotoPickerViewModel {

    private let disposeBag = DisposeBag()
    
    var picsDiaporama: [String] = []
    var updateUI = BehaviorRelay<Void>(value: ())
    var title: String {
        "Restaurant Photos"
    }
    
    var numberOfRowInSection: Int {
        picsDiaporama.count
    }
    
    func photoString(at index: Int) -> String {
        picsDiaporama[index]
    }
    
    func viewDidLoad() {
        self.updateUI.accept(())
    }
}
