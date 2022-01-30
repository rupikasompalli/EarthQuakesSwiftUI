//
//  FilterView.swift
//  EathQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-30.
//

import SwiftUI

struct FilterView: View {
    
    let viewModel: FilterViewModel
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List(FilterType.allCases) { type in
            Text(type.rawValue)
                .onTapGesture {
                    viewModel.preferenceSelected(type: type)
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: .init())
    }
}
