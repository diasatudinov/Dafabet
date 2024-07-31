//
//  TripDetailsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import SwiftUI

struct TripDetailsUIView: View {
    @State var trip: Trip
    @ObservedObject var viewModel: TripsViewModel
    @State private var showAddDescentSheet = false
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                if let image = trip.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 245)
                        .clipShape(Rectangle())
                        .padding(.bottom)
                    
                } else {
                    Rectangle()
                        .frame(height: 245)
                        .foregroundColor(.black.opacity(0.4))
                        .padding(.bottom)
                }
                
                HStack(spacing: 10) {
                    ZStack {
                        Color.white.ignoresSafeArea()
                        
                        VStack {
                            HStack {
                                Text("Date")
                                    .font(.system(size: 13))
                                    .foregroundColor(.black.opacity(0.7))
                                Spacer()
                                Image(systemName: "calendar")
                                    .font(.system(size: 17, weight: .medium))
                                    .foregroundColor(.red)
                                
                            }
                            Spacer()
                            HStack {
                                Text("\(trip.startDate) - \(trip.endDate)")
                                    .font(.system(size: 20, weight: .semibold))
                                Spacer()
                            }
                            
                        }.padding()
                    }
                    .frame(width: UIScreen.main.bounds.width / 2.2, height: 85)
                    .cornerRadius(12)
                    
                    ZStack {
                        Color.white.ignoresSafeArea()
                        
                        VStack {
                            HStack {
                                Text("Distance")
                                    .font(.system(size: 13))
                                    .foregroundColor(.black.opacity(0.7))
                                Spacer()
                                Image(systemName: "flag.checkered")
                                    .font(.system(size: 17, weight: .medium))
                                    .foregroundColor(.red)
                                
                            }
                            Spacer()
                            HStack {
                                Text("\(trip.distance) km")
                                    .font(.system(size: 20, weight: .semibold))
                                Spacer()
                            }
                            
                        }.padding()
                    }
                    .frame(width: UIScreen.main.bounds.width / 2.2, height: 85)
                    .cornerRadius(12)
                }.padding(.bottom)
                
                ScrollView {
                    ForEach(trip.descents, id: \.self){ descent in
                        DescentCellUIView(descent: descent)
                            .padding(.horizontal)
                    }
                }
                Button {
                    showAddDescentSheet = true
                } label: {
                    
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 54)
                            .foregroundColor(Color.onboardingBtn)
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                            .padding(.horizontal)
                        HStack(spacing: 4) {
                            Image(systemName: "plus.circle")
                            Text("Add descent")
                            
                        }.font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }.background(Color.onboardingBtn)
                    .cornerRadius(18)
                    .padding(.horizontal)
                .padding(.bottom, 40)
                Spacer()
            }.navigationTitle("\(trip.name)")
                .navigationBarItems(trailing:
                                        Button {
                    viewModel.deleteTrip(for: trip)
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.onboardingBtn)
                })
                .sheet(isPresented: $showAddDescentSheet) {
                    NewDescentUIView(showAddDescentSheet: $showAddDescentSheet, viewModel: viewModel, trip: trip)
                }
        }
    }
}

#Preview {
    TripDetailsUIView(trip: Trip(imageData: UIImage(named: "demo1")?.jpegData(compressionQuality: 1.0), name: "Whistler Blackcomb", startDate: "03.02", endDate: "24.02", distance: "940.4", descents: [
        Descent(name: "Panorama", distance: "0", maxSpeed: "0", descentTime: "0", time: "15:00"),
        Descent(name: "Olympic descent", distance: "1.2", maxSpeed: "32", descentTime: "14", time: "16:40"),
        Descent(name: "Panorama", distance: "3.2", maxSpeed: "44", descentTime: "20", time: "15:00"),
        Descent(name: "Olympic descent", distance: "1.2", maxSpeed: "32", descentTime: "14", time: "16:40")
    ]), viewModel: TripsViewModel())
}
