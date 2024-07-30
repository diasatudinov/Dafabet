//
//  EditStatsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 30.07.2024.
//

import SwiftUI

struct EditStatsUIView: View {
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var name = "Username"
    @State private var recorded = "0"
    @State private var avgSpeed = "0"
    @State private var maxSpeed = "0"
    @State private var distance = "0"
    @State private var time = "0"
    @State private var peakAlt = "0"
    @State private var longestRun = "0"
    @State private var selectedSegment = 0
    let segments = ["Newbie", "Medium", "Profi"]
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Edit statistics")
                ScrollView {
                    ZStack {
                        
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 279, height: 176)
                                .clipShape(Rectangle())
                                .cornerRadius(8)
                        } else {
                            
                            Rectangle()
                                .frame(width: 279, height: 176)
                                .cornerRadius(8)
                                .foregroundColor(.black.opacity(0.1))
                            
                        }
                        
                        VStack {
                            Image(systemName: "photo.badge.plus")
                                .font(.system(size: 47, weight: .bold))
                                .frame(width: 62, height: 62)
                            
                            Text("Edit photo")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 17, weight: .semibold))
                        }.foregroundColor(Color.white)
                        
                    }.padding(.bottom, 27)
                        .onTapGesture {
                            isShowingImagePicker = true
                            
                        }
                    
                    HStack {
                        Text("Info")
                            .font(.system(size: 20).weight(.semibold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    ZStack {
                        Color.white
                        
                        HStack {
                            
                            TextField("", text: $name)
                                .font(.system(size: 20, weight: .semibold))
                            
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.onboardingBtn)
                                .font(.title2)
                            
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<segments.count, id: \.self) { index in
                            Button(action: {
                                selectedSegment = index
                            }) {
                                Text(segments[index])
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(selectedSegment == index ? .white : .black.opacity(0.7))
                                    .padding(12)
                                    .frame(maxWidth: .infinity)
                                    .background(selectedSegment == index ? Color.red : Color.white)
                                    .cornerRadius(15)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.top, 5)
                    
                    HStack {
                        Text("Bests")
                            .font(.system(size: 20).weight(.semibold))
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.top, 32)
                    
                    ZStack {
                        Color.white
                        
                        HStack(alignment: .bottom) {
                            
                            Text("Recorded")
                                .font(.system(size: 17))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                            TextField("", text: $recorded)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            Text("RUNS")
                                .font(.system(size: 13, weight: .semibold))
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    
                    ZStack {
                        Color.white
                        
                        HStack(alignment: .bottom) {
                            
                            Text("Avg speed")
                                .font(.system(size: 17))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                            
                            TextField("", text: $avgSpeed)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            Text("km/h")
                                .font(.system(size: 13, weight: .semibold))
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    
                    ZStack {
                        Color.white
                        
                        HStack(alignment: .bottom) {
                            
                            Text("Max speed")
                                .font(.system(size: 17))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                            TextField("", text: $maxSpeed)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            Text("km/h")
                                .font(.system(size: 13, weight: .semibold))
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    
                    ZStack {
                        Color.white
                        
                        HStack(alignment: .bottom) {
                            
                            Text("Total distance")
                                .font(.system(size: 17))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                            TextField("", text: $distance)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            Text("km")
                                .font(.system(size: 13, weight: .semibold))
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    
                    ZStack {
                        Color.white
                        
                        HStack(alignment: .bottom) {
                            
                            Text("Total time")
                                .font(.system(size: 17))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                            TextField("", text: $time)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    
                    ZStack {
                        Color.white
                        
                        HStack(alignment: .bottom) {
                            
                            Text("Peak alt")
                                .font(.system(size: 17))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                            TextField("", text: $peakAlt)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            Text("FH")
                                .font(.system(size: 13, weight: .semibold))
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    
                    ZStack {
                        Color.white
                        
                        HStack(alignment: .bottom) {
                            
                            Text("Longest run")
                                .font(.system(size: 17))
                                .foregroundColor(.black.opacity(0.5))
                            Spacer()
                            TextField("", text: $longestRun)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            Text("MI")
                                .font(.system(size: 13, weight: .semibold))
                            
                        }.padding()
                    }.frame(height: 50)
                        .cornerRadius(12)
                    Spacer()
                }
            }.padding(.horizontal)
            .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
            }
        }
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
}

#Preview {
    EditStatsUIView()
}
