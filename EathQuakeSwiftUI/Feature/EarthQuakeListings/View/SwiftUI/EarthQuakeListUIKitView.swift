//
//  EarthQuakeListUIKitView.swift
//  EathQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-30.
//

import Foundation
import UIKit
import SwiftUI

struct EarthQuakeListUIKitView: UIViewControllerRepresentable {
    
    let viewModel: EarthQuakeViewModel
    
    func makeUIViewController(context: Context) -> UINavigationController {
        return UINavigationController(rootViewController: EarthQuakeViewController(viewModel: viewModel))
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}
