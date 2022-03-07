//
//  PickerPhotoSection.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import Foundation

struct PickerPhotoSection {
    enum Section: Int {
        case pickerPhoto
        
        func cellIdentifier() -> String {
            switch self {
            case .pickerPhoto:
                return "pickerPhoto"
            }
        }
    }
}
