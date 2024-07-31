//
//  NewDescentUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import SwiftUI

struct NewDescentUIView: View {
    @State private var name = ""
    @State private var distance = "0"
    @State private var maxSpeed = "0"
    @State private var descentTime = "0"
    @Binding var showAddDescentSheet: Bool
    @ObservedObject var viewModel: TripsViewModel
    @State var trip: Trip

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Text("New descent")
                    .font(.system(size: 17, weight: .semibold))
                    .padding()
                    .padding(.bottom, 14)
                ZStack {
                    Color.white
                    
                    HStack() {
                    
                        TextField("Name", text: $name)
                            .font(.system(size: 17))
                        
                    }.padding()
                }.frame(height: 50)
                    .cornerRadius(12)
                
                ZStack {
                    Color.white
                    
                    HStack(alignment: .bottom) {
                        
                        Text("Distance")
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
                        
                        Text("Descent time")
                            .font(.system(size: 17))
                            .foregroundColor(.black.opacity(0.5))
                        Spacer()
                        TextField("", text: $descentTime)
                            .font(.system(size: 17, weight: .semibold))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                        Text("min")
                            .font(.system(size: 13, weight: .semibold))
                        
                    }.padding()
                }.frame(height: 50)
                    .cornerRadius(12)
               
                Spacer()
                Button {
                    if !name.isEmpty {
                        viewModel.addDescent(for: trip, descent: Descent(name: name, distance: distance, maxSpeed: maxSpeed, descentTime: descentTime, time: updateCurrentTime()))
                        showAddDescentSheet = false
                        
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
                    }
                }
                    .cornerRadius(18)
            }.padding(.horizontal)
        }
    }
    
    private func updateCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // Форматирует время как "ЧЧ:ММ"
        
        return formatter.string(from: Date())
    }
}

#Preview {
    NewDescentUIView(showAddDescentSheet: .constant(true), viewModel: TripsViewModel(), trip: Trip(name: "", startDate: "", endDate: "", distance: "", descents: []))
}
