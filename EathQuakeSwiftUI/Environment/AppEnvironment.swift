//
//  AppEnvironment.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import Foundation

protocol Environment {
    var earthQuakeService: EarthQuakeServiceProtocol { get }
}

protocol AppFactory {
    func makeEarthQuakeListView() -> EarthQuakeViewController
    func makeEarthQuakeListView() -> EarthQuakeListView
}

struct AppEnvironment: Environment {
    static let current = AppEnvironment()
    
    var useSwiftUIView = true
    
    var earthQuakeService: EarthQuakeServiceProtocol {
        return EarthQuakeServiceBackend()
    }
}

extension AppEnvironment: AppFactory {
    func makeEarthQuakeListView() -> EarthQuakeViewController {
        let vm = EarthQuakeViewModel(service: earthQuakeService)
        let view = EarthQuakeViewController(viewModel: vm)
        return view
    }
    
    func makeFilterListView() -> FilterViewController {
        let vm = FilterViewModel()
        let view = FilterViewController(viewModel: vm)
        return view
    }
    
    func makeEarthQuakeListView() -> EarthQuakeListView {
        let vm = EarthQuakeViewModel(service: earthQuakeService)
        return EarthQuakeListView(viewModel: vm)
    }
    
    func makeEarthQuakeUIkitListView() -> EarthQuakeListUIKitView {
        let vm = EarthQuakeViewModel(service: earthQuakeService)
        return EarthQuakeListUIKitView(viewModel: vm)
    }
}
