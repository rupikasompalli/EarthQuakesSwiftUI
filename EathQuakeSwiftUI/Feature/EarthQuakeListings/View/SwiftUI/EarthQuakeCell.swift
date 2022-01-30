//
//  EarthQuakeCell.swift
//  EathQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import SwiftUI

struct EarthQuakeCell: View {
    
    let model: EartQuakeData
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(model.datetime.displayDate ?? "N/A").font(.title2).bold()
                    Spacer()
                    Text(model.magnitude >= 8.0 ? L10n.EarthQuakeList.Cell.high : L10n.EarthQuakeList.Cell.low)
                        .frame(height: 30)
                        .frame(maxWidth: 100)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 40, style: .continuous).fill(model.magnitude >= 8.0 ? Color.red : .green)
                        )
                }
                HStack {
                    VStack(spacing: 5) {
                        Text(model.depth.asString)
                        Text(L10n.EarthQuakeList.Cell.depth)
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack(spacing: 5) {
                        Text(model.magnitude.asString)
                        Text(L10n.EarthQuakeList.Cell.magnitude)
                            .font(.caption)
                            .fontWeight(.heavy)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "map")
                            .foregroundColor(.blue)
                    }
                }.padding(.horizontal)
            }
        }
        .padding()
        .frame(height: 120, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        )
        
    }
}

struct EarthQuakeCell_Previews: PreviewProvider {
    static var previews: some View {
        EarthQuakeCell(model: .init(datetime: "2019-02-22 12:33:22", depth: 22, lng: 22, src: "", eqid: "", magnitude: 22, lat: 22)) 
    }
}
