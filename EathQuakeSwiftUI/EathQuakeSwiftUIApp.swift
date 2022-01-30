//
//  EathQuakeSwiftUIApp.swift
//  EathQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-28.
//

import SwiftUI

@main
struct EathQuakeSwiftUIApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            if AppEnvironment.current.useSwiftUIView {
                AppEnvironment.current.makeEarthQuakeListView()
            } else {
                AppEnvironment.current.makeEarthQuakeUIkitListView()
            }
        }
    }
}
