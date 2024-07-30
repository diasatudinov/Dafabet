//
//  StatisticsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 30.07.2024.
//

import SwiftUI

struct StatisticsUIView: View {
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
                            StatisticsOne()
                            StatisticsTwo()
                            StatisticsThree()
                        }
                    }.padding(.horizontal).padding(.bottom, 40)
                }.navigationBarItems(trailing:
                                        Button {
                    // showAddTrackSheet = true
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.onboardingBtn)
                        .font(.title2)
                    
                }
                )
            }
        }
    }
}

#Preview {
    StatisticsUIView()
}


struct StatisticsOne: View {
    @State private var selectedImage: UIImage?
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            HStack {
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 225, height: 183)
                        .clipShape(Circle())
                        .cornerRadius(6)
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
                        Text("0 RUNS")
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
                        Text("0.0 km/h")
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
                        Text("0.0 km/h")
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
    @State private var selectedImage: UIImage?
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            HStack {
                
                Text("Username")
                    .font(.system(size: 22, weight: .bold))
                Spacer()
                Text("Profi")
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
    @State private var selectedImage: UIImage?
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
                            Text("0.0 Km")
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
                            Text("00:00:00")
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
                            Text("0.0 FH")
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
                            Text("0.0 MI")
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
