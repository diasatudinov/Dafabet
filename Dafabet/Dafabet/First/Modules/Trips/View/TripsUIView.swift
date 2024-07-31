//
//  TripsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import SwiftUI

struct TripsUIView: View {
    @ObservedObject var viewModel: TripsViewModel
    @State private var showAddTripSheet = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Trips")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .bold()
                        Spacer()
                    }.padding(.horizontal)
                    //MARK: Check for number of items in array
                    if viewModel.trips.isEmpty {
                        
                        VStack {
                            Spacer()
                            Image("emptyArrayTrip")
                                .padding(.bottom, 50)
                            
                            Text("You don't have any added \ntrips yet!")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.bottom, 18)
                            
                            Button {
                                showAddTripSheet = true
                            } label: {
                                
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(height: 54)
                                        .foregroundColor(Color.onboardingBtn)
                                        .font(.system(size: 17, weight: .bold))
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                    HStack(spacing: 4) {
                                        Image(systemName: "plus.circle.fill")
                                        Text("Add")
                                        
                                    }.font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                            }.background(Color.onboardingBtn)
                                .cornerRadius(18)
                                .padding(.horizontal, 69)
                                .padding(.bottom, 18)
                            
                            Button {
                                viewModel.viewDemo()
                            } label: {
                                
                                Text("View demo")
                                .font(.system(size: 16, weight: .medium))
                                .underline()
                                .foregroundColor(.black.opacity(0.7))
                            }
                            Spacer()
                            Spacer()
                        }
                    } else {
                        ScrollView {
                            
                            ForEach(viewModel.trips, id: \.self){ trip in
                                NavigationLink {
                                    TripDetailsUIView(trip: trip, viewModel: viewModel)
                                } label: {
                                    
                                    TripCellUIView(trip: trip)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                    //                                    .onTapGesture {
                                    //                                        selectedTrack = track
                                    //                                    }
                                }
                            }
                        }.padding(.bottom, 40)
                    }
                    Spacer()
                }.navigationBarItems(trailing:
                                        Button {
                    showAddTripSheet = true
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.onboardingBtn)
                        .font(.title2)
                    
                }
                )
                .sheet(isPresented: $showAddTripSheet) {
                    NewTripUIView(viewModel: viewModel, showAddTripSheet: $showAddTripSheet)
                }
            }
        }
    }
}

#Preview {
    TripsUIView(viewModel: TripsViewModel())
}
