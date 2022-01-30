//
//  EarthQuakeViewModel.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import Foundation
import Combine
import UIKit

class EarthQuakeViewModel: ObservableObject {
    
    let earthQuakeService: EarthQuakeServiceProtocol
    
    @Published var earthQuakesData: [EartQuakeData]?
    @Published var error: Error? = nil
    @Published var filterType: FilterType?
    
    var cancelSet: Set<AnyCancellable> = []
    
    init(service: EarthQuakeServiceProtocol) {
        earthQuakeService = service
        
        NotificationCenter.default.publisher(for: .filterSelected)
                    .compactMap{ $0.object as? FilterType }
                    .sink() {
                        [weak self] type in
                        self?.filterType = type
                        self?.performFiltering()
                    }
                    .store(in: &cancelSet)
    }
    
    private func performFiltering() {
        if let type = filterType {
            switch type {
            case .magnitude:
                self.earthQuakesData = self.earthQuakesData?.sorted { $0.magnitude < $1.magnitude }
            case .depth:
                self.earthQuakesData = self.earthQuakesData?.sorted { $0.depth < $1.depth }
            }
        }
    }
    
    func fetchData() {
        earthQuakeService.fetchEarthQuakeData { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.earthQuakesData = data
                    self?.performFiltering()
                }
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
