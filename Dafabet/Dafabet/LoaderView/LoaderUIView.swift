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
    
    @State private var apiResponse: ApiResponse?
    private let apiService = ApiService()
    @State private var errorMessage: String?

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
                    fetch()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            if let response = apiResponse {
                if response.isDefault {
                    ReOnboardingUIView()
                        .onAppear {
                            print(response.isDefault)
                        }
                } else {
                    UsUIView(decodeString: response.isScheduled)
                        .onAppear {
                            print(response.isDefault)
                        }
                }
            } else {
                ReOnboardingUIView()
                    .onAppear {
                        print("Error")
                    }
            }
            
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
    
    func fetch() {
        apiService.fetchData { result in
            switch result {
            case .success(let data):
                self.apiResponse = data
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    LoaderUIView()
}
