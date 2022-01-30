//
//  EarthQuakeListView.swift
//  EathQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import SwiftUI

struct EarthQuakeListView: View {
    
    @StateObject var viewModel: EarthQuakeViewModel
    @State var showSettings: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if let type = viewModel.filterType {
                        HStack {
                            Text(type.rawValue)
                                .padding(.horizontal)
                        }.background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous).fill(.gray)
                        )
                    }
                    ForEach(viewModel.earthQuakesData ?? []) { data in
                        NavigationLink(
                            destination: EarthQuakeMapView(model: data)
                        ) {
                            EarthQuakeCell(model: data)
                        }
                    }
                }.padding()
            }.onAppear {
                viewModel.fetchData()
            }
            .navigationTitle(L10n.EarthQuakeList.title)
            .toolbar {
                NavigationLink(
                    destination: FilterView(viewModel: .init())
                ) {
                    Image(systemName: "gear")
                }
                
            }
        }.tint(.black)
    }
}

struct EarthQuakeListView_Previews: PreviewProvider {
    static var previews: some View {
        AppEnvironment.current.makeEarthQuakeListView()
    }
}
