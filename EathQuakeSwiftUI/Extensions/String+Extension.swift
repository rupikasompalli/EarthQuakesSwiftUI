//
//  Double+Extension.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import Foundation

extension String {
    var displayDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: self) ?? Date()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
