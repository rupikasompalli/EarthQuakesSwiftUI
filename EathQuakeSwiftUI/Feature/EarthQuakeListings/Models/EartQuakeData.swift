//
//  EartQuakeData.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import Foundation
import CoreLocation

struct EartQuakeData: Codable, Identifiable {
    
    var id: String { eqid }
    var datetime: String
    var depth: Double
    var lng: Double
    var src: String
    var eqid: String
    var magnitude: Double
    var lat: Double
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
