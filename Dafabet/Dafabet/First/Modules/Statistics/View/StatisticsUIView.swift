//
//  StatisticsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 30.07.2024.
//

import SwiftUI

struct StatisticsUIView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showEditProfileView = false

    var body: some View {
        NavigationView {
            
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Statistics")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .bold()
                        Spacer()
                    }.padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            if !showEditProfileView {
                                StatisticsOne(selectedImage: viewModel.profile.image, recorded: viewModel.profile.recorded, avgSpeed: viewModel.profile.avgSpeed, maxSpeed: viewModel.profile.maxSpeed)
                                StatisticsTwo(name: viewModel.profile.name, level: viewModel.profile.level)
                                StatisticsThree(distance: viewModel.profile.distance, time: viewModel.profile.time, peakAlt: viewModel.profile.peakAlt, longestRun: viewModel.profile.longestRun)
                            }
                        }
                    }.padding(.horizontal).padding(.bottom, 40)
                }.navigationBarItems(trailing:
                                        Button {
                     showEditProfileView = true
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.onboardingBtn)
                        .font(.title2)
                    
                }
                )
            }.sheet(isPresented: $showEditProfileView) {
                EditStatsUIView(viewModel: viewModel, showEditProfileView: $showEditProfileView)
            }
            .onAppear {
                showEditProfileView = false
            }
            
        }
    }
}

#Preview {
    StatisticsUIView(viewModel: ProfileViewModel())
}


struct StatisticsOne: View {
    @State var selectedImage: UIImage?
    @State var recorded: String
    @State var avgSpeed: String
    @State var maxSpeed: String
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            HStack {
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 225, height: 183)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                        .padding()
                } else {
                    ZStack {
                        Rectangle()
                            .frame(width: 225, height: 183)
                            .cornerRadius(8)
                            .foregroundColor(.black.opacity(0.1))
                        VStack {
                            Image(systemName: "photo.badge.plus")
                                .font(.system(size: 47))
                                .frame(width: 62, height: 62)
                                
                            Text("Upload a new \nphoto")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 17, weight: .semibold))
                        }.foregroundColor(Color.black.opacity(0.5))
                    }.padding()
                }
                VStack(spacing: 26) {
                    VStack(alignment: .leading) {
                        Text("\(recorded) RUNS")
                        .font(.system(size: 13)
                        .weight(.semibold))
                        .foregroundColor(.black)
                        
                        HStack(spacing: 2) {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.system(size: 12))
                            Text("recorded")
                                .font(.system(size: 12))
                            Spacer()
                        }.foregroundColor(.black.opacity(0.5))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(avgSpeed) km/h")
                        .font(.system(size: 13)
                        .weight(.semibold))
                        .foregroundColor(.black)
                        
                        HStack(spacing: 2) {
                            Image(systemName: "timer")
                                .font(.system(size: 12))
                            Text("avg speed")
                                .font(.system(size: 12))
                            Spacer()
                        }.foregroundColor(.black.opacity(0.5))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(maxSpeed) km/h")
                        .font(.system(size: 13)
                        .weight(.semibold))
                        .foregroundColor(.black)
                        
                        HStack(spacing: 2) {
                            Image(systemName: "gauge.with.needle")
                                .font(.system(size: 12))
                            Text("max speed")
                                .font(.system(size: 12))
                            Spacer()
                        }.foregroundColor(.black.opacity(0.5))
                    }
                }
                Spacer()
            }
        }.cornerRadius(12)
    }
}

struct StatisticsTwo: View {
    @State var name: String
    @State var level: String
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            HStack {
                
                Text(name)
                    .font(.system(size: 22, weight: .bold))
                Spacer()
                Text(level)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background (
                        Rectangle()
                            .cornerRadius(22)
                            .foregroundColor(.red)
                            
                    )
                        
                
            }.padding()
        }.cornerRadius(12)
    }
}

struct StatisticsThree: View {
    @State var distance: String
    @State var time: String
    @State var peakAlt: String
    @State var longestRun: String
    var body: some View {
        
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                ZStack {
                    Color.white.ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Image(systemName: "flag.checkered")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.red)
                            Spacer()
                        }.padding(.bottom, 17)
                        
                        HStack {
                            Text("\(distance) Km")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                        }.padding(.bottom, 8)
                        
                        HStack {
                            Text("Total distance")
                                .font(.system(size: 15))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                        }
                        
                    }.padding()
                }
                .frame(width: UIScreen.main.bounds.width / 2.2)
                .cornerRadius(12)
                
                ZStack {
                    Color.white.ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Image(systemName: "clock")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.red)
                            Spacer()
                        }.padding(.bottom, 17)
                        
                        HStack {
                            Text(time)
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                        }.padding(.bottom, 8)
                        
                        HStack {
                            Text("Total time")
                                .font(.system(size: 15))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                        }
                        
                    }.padding()
                }
                .frame(width: UIScreen.main.bounds.width / 2.2)
                .cornerRadius(12)
            }
            
            HStack(spacing: 12) {
                ZStack {
                    Color.white.ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Image(systemName: "arrow.up")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.red)
                            Spacer()
                        }.padding(.bottom, 17)
                        
                        HStack {
                            Text("\(peakAlt) FH")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                        }.padding(.bottom, 8)
                        
                        HStack {
                            Text("Peak alt")
                                .font(.system(size: 15))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                        }
                        
                    }.padding()
                }
                .frame(width: UIScreen.main.bounds.width / 2.2)
                .cornerRadius(12)
                
                ZStack {
                    Color.white.ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.red)
                            Spacer()
                        }.padding(.bottom, 17)
                        
                        HStack {
                            Text("\(longestRun) MI")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                        }.padding(.bottom, 8)
                        
                        HStack {
                            Text("Longest run")
                                .font(.system(size: 15))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                        }
                        
                    }.padding()
                }
                .frame(width: UIScreen.main.bounds.width / 2.2)
                .cornerRadius(12)
            }
        }
        
    }
}
