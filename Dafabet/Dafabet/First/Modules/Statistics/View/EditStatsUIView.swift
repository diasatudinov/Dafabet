//
//  EditStatsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 30.07.2024.
//

import SwiftUI

struct EditStatsUIView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var name = "Username"
    @State private var recorded = "0"
    @State private var avgSpeed = "0"
    @State private var maxSpeed = "0"
    @State private var distance = "0"
    @State private var time = "00:00:00"
    @State private var peakAlt = "0"
    @State private var longestRun = "0"
    @State private var selectedSegment = 0
    let segments = ["Newbie", "Medium", "Profi"]
    @Binding var showEditProfileView: Bool
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Edit statistics")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
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
                                .onChange(of: time) { newValue in
                                    time = formatTimeInput(newValue)
                                }
                            
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
                    
                    Button {
                        if let image = selectedImage {
                            let profile = Profile(imageData: image.jpegData(compressionQuality: 1.0), name: name, level: segments[selectedSegment], recorded: recorded, avgSpeed: avgSpeed, maxSpeed: maxSpeed, distance: distance, time: time, peakAlt: peakAlt, longestRun: longestRun)
                            
                            viewModel.saveProfile(profile)
                        } else {
                            let profile = Profile(name: name, level: segments[selectedSegment], recorded: recorded, avgSpeed: avgSpeed, maxSpeed: maxSpeed, distance: distance, time: time, peakAlt: peakAlt, longestRun: longestRun)
                            viewModel.saveProfile(profile)
                        }
                        showEditProfileView = false
                    } label: {
                        
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(height: 54)
                                .foregroundColor(Color.onboardingBtn)
                                .font(.system(size: 17, weight: .bold))
                                .cornerRadius(16)
                                .padding(.horizontal)
                            HStack(spacing: 4) {
                                Image(systemName: "checkmark")
                                Text("Save")
                                
                            }.font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }.background(Color.onboardingBtn)
                        .cornerRadius(18)
                        //.padding(.horizontal, 24)
                        .padding(.top)
                        .padding(.bottom)
                }.padding(.horizontal)
            }
            .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
            }
        }.onAppear {
            selectedImage = viewModel.profile.image
            name = viewModel.profile.name
            recorded = viewModel.profile.recorded
            avgSpeed = viewModel.profile.avgSpeed
            maxSpeed = viewModel.profile.maxSpeed
            distance = viewModel.profile.distance
            time = viewModel.profile.time
            peakAlt = viewModel.profile.peakAlt
            longestRun = viewModel.profile.longestRun
        }
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
    
    func formatTimeInput(_ input: String) -> String {
            let digitsOnly = input.filter { "0123456789".contains($0) }
            var formattedString = ""

            for (index, character) in digitsOnly.prefix(6).enumerated() {
                if index == 2 || index == 4 {
                    formattedString.append(":")
                }
                formattedString.append(character)
            }

            return formattedString
        }
}

#Preview {
    EditStatsUIView(viewModel: ProfileViewModel(), showEditProfileView: .constant(true))
}
