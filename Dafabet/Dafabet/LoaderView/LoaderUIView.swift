//
//  LoaderUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 29.07.2024.
//

import SwiftUI

struct LoaderUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    
    var body: some View {
        if isLoadingView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 235)
                        .padding(.top, UIScreen.main.bounds.height / 4.8)
                    Spacer()
                    ZStack {
                        
                        ProgressView(value: progress, total: 100)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(.red)
                            .cornerRadius(15)
                            .scaleEffect(y: 2.5, anchor: .center)
                            .padding(.horizontal, 92)
                            
                    }
                    HStack {
                        Text("Loading")
                            
                            
                        
                        Text("\(Int(progress))%")
                    }
                    .font(.system(size: 17, weight: .semibold))
                  
                    .foregroundColor(.black)
                    .padding(14)
                    .padding(.bottom, 60)
                }
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            ReOnboardingUIView()
        }
    }
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
}

#Preview {
    LoaderUIView()
}
