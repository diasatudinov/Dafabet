//
//  TripCellUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import SwiftUI

struct TripCellUIView: View {
    @State var trip: Trip
    var body: some View {
        ZStack {
            if let image = trip.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 258)
                    .clipShape(Rectangle())
                    .cornerRadius(8)
                
            } else {
                Rectangle()
                    .frame(height: 258)
                    .cornerRadius(8)
                    .foregroundColor(.black.opacity(0.4))
            }
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Whistler Blackcomb")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        Text("03.02 - 24.02")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding()
                Spacer()
                HStack {
                    Image(systemName: "map")
                    Text("940.4 km")
                    Spacer()
                }.font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom)
            }.frame(height: 258)
            
        }
    }
}

#Preview {
    TripCellUIView(trip: Trip(imageData: UIImage(named: "demo1")?.jpegData(compressionQuality: 1.0), name: "Whistler Blackcomb", startDate: "03.02", endDate: "24.02", distance: "940.4", descents: []))
}
