//
//  EarthQuakeListViewModelTests.swift
//  EathQuakeSwiftUITests
//
//  Created by Rupika Sompalli on 2022-01-30.
//

import XCTest
import Combine
@testable import EathQuakeSwiftUI

class EarthQuakeListViewModelTests: XCTestCase {

    var viewModel: EarthQuakeViewModel!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = EarthQuakeViewModel(service: EarthQuakeServicesMock())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_viewModelInitialState() {
        XCTAssertNil(viewModel.earthQuakesData)
        XCTAssertNil(viewModel.error)
        XCTAssertNil(viewModel.filterType)
    }
    
    func test_fetchCars() {
        let expectation = self.expectation(description: "fetch_data")
        viewModel.fetchData()
        viewModel
            .$earthQuakesData
            .dropFirst()
            .sink { data in
                expectation.fulfill()
            }
        .store(in: &cancellables)
        
        waitForExpectations(timeout: 1.0, handler: nil)
        XCTAssertTrue(viewModel.earthQuakesData?.count ?? 0 > 0)
    }
    
    
    func mockEarthQuakeData() -> EartQuakeData {
        .init(datetime: "", depth: 22, lng: 22, src: "", eqid: "", magnitude: 22, lat: 22)
    }
}
