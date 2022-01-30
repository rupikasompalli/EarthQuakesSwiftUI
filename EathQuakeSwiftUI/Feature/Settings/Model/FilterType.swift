//
//  FilterType.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-22.
//

import Foundation

enum FilterType: String, CaseIterable, Identifiable {
    
    var id: String {
        rawValue
    }
    
    case magnitude = "Filter By Magnitude"
    case depth = "Filter By Depth"
}
