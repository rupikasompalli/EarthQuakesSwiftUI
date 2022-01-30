//
//  EarthQuakeServicesMock.swift
//  EathQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-30.
//

import Foundation
struct EarthQuakeServicesMock: EarthQuakeServiceProtocol {
    func fetchEarthQuakeData(completion: @escaping EarthQuakeServiceResult) {
        let url = Bundle.main.url(forResource: "EarthQuakeData", withExtension: "json")
        guard let url = url else {
            print("no json url")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let listings = try decoder.decode(EarthQuakes.self, from: data)
            completion(.success(listings.earthquakes))
        } catch  {
            debugPrint("error", error)
            completion(.failure(error))
        }
    }
}
