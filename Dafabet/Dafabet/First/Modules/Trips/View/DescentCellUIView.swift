//
//  DescentCellUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import SwiftUI

struct DescentCellUIView: View {
    @State var descent: Descent
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    
                    Text(descent.name)
                        .font(.system(size: 17, weight: .semibold))
                    Spacer()
                    Text(descent.time)
                        .font(.system(size: 15))
                        .foregroundColor(.black.opacity(0.5))
                        
                    
                    
                }.padding(.horizontal).padding(.bottom, 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("distance")
                            .font(.system(size: 13))
                            .foregroundColor(.black.opacity(0.3))
                        HStack {
                            Image(systemName: "flag.checkered")
                            Text("\(descent.distance) km")
                                
                        }.font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 8) {
                        Text("max speed")
                            .font(.system(size: 13))
                            .foregroundColor(.black.opacity(0.3))
                        HStack {
                            Image(systemName: "timer")
                            Text("\(descent.maxSpeed) km/h")
                                
                        }.font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("distance")
                            .font(.system(size: 13))
                            .foregroundColor(.black.opacity(0.3))
                        HStack {
                            Image(systemName: "clock")
                            Text("\(descent.descentTime) min")
                                
                        }.font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(.horizontal)
            }.padding(.vertical)
        }.cornerRadius(12)
    }
}

#Preview {
    DescentCellUIView(descent: Descent(name: "Panorama", distance: "3.2", maxSpeed: "44", descentTime: "20", time: "15:00"))
}
