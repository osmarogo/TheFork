//
//  HomeSection.swift
//  TheFork
//
//  Created by Oscar on 6/03/22.
//

import Foundation

struct HomeSection { 
    enum Section: Int {
        case header
        case body
        case location
        case book
        
        func cellIdentifier() -> String {
            switch self {
            case .header:
                return "headerCell"
            case .body:
                return "bodyCell"
            case .location:
                return "locationCell"
            case .book:
                return "bookCell"
            }
        }
    }
}
