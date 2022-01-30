//
//  EarthQuakeMapView.swift
//  EathQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-30.
//

import SwiftUI
import MapKit

struct EarthQuakeMapView: View {
    
    var model: EartQuakeData
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(center: model.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }

    var body: some View {
        Map(coordinateRegion: .constant(region))
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct EarthQuakeMapView_Previews: PreviewProvider {
    static var previews: some View {
        EarthQuakeMapView(model: .init(datetime: "", depth: 2, lng: 2, src: "", eqid: "", magnitude: 2, lat: 2))
    }
}
