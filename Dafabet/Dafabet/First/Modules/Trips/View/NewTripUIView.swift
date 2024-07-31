//
//  NewTripUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import SwiftUI

struct NewTripUIView: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @State private var name = ""
    @State private var distance = "0"
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @ObservedObject var viewModel: TripsViewModel
    @Binding var showAddTripSheet: Bool
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack {
                Text("New trip")
                    .font(.system(size: 17, weight: .semibold))
                    .padding()
                    .padding(.bottom, 14)
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 245)
                        .clipShape(Rectangle())
                        .onTapGesture {
                            isShowingImagePicker = true
                        }
                    
                } else {
                    ZStack {
                        Rectangle()
                            .frame(height: 245)
                            .foregroundColor(.black.opacity(0.1))
                            
                        
                        VStack {
                            Image(systemName: "photo.badge.plus")
                                .font(.system(size: 47))
                                .frame(width: 62, height: 62)
                                
                            Text("Upload a new \nphoto")
                                .multilineTextAlignment(.center)
                                .font(.system(size: 17, weight: .semibold))
                        }.foregroundColor(Color.black.opacity(0.5))
                    }.onTapGesture {
                        isShowingImagePicker = true
                    }
                }
                
                ZStack {
                    Color.white
                    
                    HStack() {
                    
                        TextField("Enter name", text: $name)
                            .font(.system(size: 17))
                        
                    }.padding()
                }.frame(height: 50)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                ZStack {
                    Color.white
                    
                    HStack(alignment: .center) {
                        
                        Text("Date")
                            .font(.system(size: 17))
                            .foregroundColor(.black.opacity(0.3))
                        
                        DatePicker("", selection: $startDate, displayedComponents: .date)
                        
                        DatePicker("", selection: $endDate, displayedComponents: .date)
                        
                    }.padding()
                }.frame(height: 50)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                ZStack {
                    Color.white
                    
                    HStack(alignment: .bottom) {
                        
                        Text("Distance")
                            .font(.system(size: 17))
                            .foregroundColor(.black.opacity(0.3))
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
                    .padding(.horizontal)
                Spacer()
                
                Button {
                    if !name.isEmpty {
                        if let image = selectedImage {
                            let trip = Trip(imageData: image.jpegData(compressionQuality: 1.0), name: name, startDate: formattedDates(date: startDate), endDate: formattedDates(date: endDate), distance: distance, descents: [])
                            viewModel.addTrip(for: trip)
                        } else {
                            let trip = Trip(name: name, startDate: formattedDates(date: startDate), endDate: formattedDates(date: endDate), distance: distance, descents: [])
                            viewModel.addTrip(for: trip)
                        }
                        showAddTripSheet = false
                        
                    }
                } label: {
                    
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 54)
                            .foregroundColor(name.isEmpty ? Color.onboardingBtn.opacity(0.4) : Color.onboardingBtn)
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark")
                            Text("Save")
                            
                        }.font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                }
                    .cornerRadius(18)
            }
        }.sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
    
    private func formattedDates(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"

        let DateString = formatter.string(from: date)

        return DateString
    }
}

#Preview {
    NewTripUIView(viewModel: TripsViewModel(), showAddTripSheet: .constant(true))
}
