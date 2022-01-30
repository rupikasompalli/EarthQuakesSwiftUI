//
//  EarthQuakeServiceBackend.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import Foundation

protocol EarthQuakeServiceProtocol {
    typealias EarthQuakeServiceResult = ((Result<[EartQuakeData], Error>) -> Void)
    func fetchEarthQuakeData(completion: @escaping EarthQuakeServiceResult)
}

class EarthQuakeServiceBackend: EarthQuakeServiceProtocol {
    func fetchEarthQuakeData(completion: @escaping EarthQuakeServiceResult) {
        let endpoint = "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman"
        guard let url = URL(string: endpoint) else {
            debugPrint("Cannot create fetch used car url")
            return
        }
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let data = data {
                    let carListings = try JSONDecoder().decode(EarthQuakes.self, from: data)
                    completion(.success(carListings.earthquakes))
                }
                if let error = error {
                    completion(.failure(error))
                }
            } catch {
                debugPrint("Cannot parse codable model", error)
                completion(.failure(error))
            }
        }.resume()
    }
}
