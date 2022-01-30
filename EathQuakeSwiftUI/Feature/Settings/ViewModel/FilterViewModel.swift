//
//  FilterViewModel.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import Foundation

class FilterViewModel {
    func preferenceSelected(type: FilterType) {
        NotificationCenter.default.post(name: .filterSelected, object: type)
    }
}
