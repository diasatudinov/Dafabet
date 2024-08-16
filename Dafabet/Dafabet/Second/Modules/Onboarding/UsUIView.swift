//
//  UsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 29.07.2024.
//

import SwiftUI
import StoreKit

struct UsUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isNotificationView: Bool = true
    @State private var pageNum: Int = 1
    @AppStorage("onboardingShowed") var onboardingShowed: Bool = false

    @State var decodeString: String
    var body: some View {
        if !onboardingShowed {
            if pageNum < 3 {
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    
                    ZStack {
                        VStack {
                            Spacer()
                            switch pageNum {
                            case 1: 
                                ZStack {
                                    VStack {
                                        
                                        Image("firstScreen")
                                            .resizable()
                                            .frame(height: 549)
                                        Spacer()
                                    }
                                    
                                    VStack {
                                        
                                        Image("blurTop")
                                        Spacer()
                                        Image("blurBottom")
                                        
                                    }
                                }.padding(.top, UIScreen.main.bounds.height/6)
                            case 2: Image("ratings")
                                    .resizable()
                                    .frame(height: 549)
                                    .ignoresSafeArea()
                            default:
                                Image("notifications")
                                    .resizable()
                                    .frame(height: 549)
                                    .ignoresSafeArea()
                            }
                            
                            Button {
                                if pageNum < 3 {
                                    pageNum += 1
                                } else {
                                    
                                }
                                
                                
                            } label: {
                                Text("Next")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }.background(Color.onboardingBtn)
                                .cornerRadius(18)
                                .padding(.horizontal, 24)
                                .padding(.bottom)
                            
                        }
                        VStack {
                            HStack(spacing: 8) {
                                Rectangle()
                                    .fill(pageNum == 1 ? Color.red : Color.gray.opacity(0.5))
                                    .frame(width: 57, height: 5)
                                    .cornerRadius(19)
                                
                                Rectangle()
                                    .fill(pageNum == 2 ? Color.red : Color.gray.opacity(0.5))
                                    .frame(width: 57, height: 5)
                                    .cornerRadius(19)
                                
                            }
                            .padding()
                            switch pageNum {
                            case 1:
                                Text("Become popular \nand rich!")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(height: 70)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                
                            case 2:
                                Text("Rate our app in the \nAppStore")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(height: 70)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .onAppear{
                                        rateApp()
                                    }
                            default:
                                Text("Don’t miss anything")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                Text("Don’t miss the most userful information")
                                    .foregroundColor(.white).opacity(0.7)
                                
                            }
                            
                        }.padding(.bottom, UIScreen.main.bounds.height * 2/2.9)
                        
                    }
                    
                }
            } else {
                if isNotificationView {
                    ZStack {
                        Color.background
                            .ignoresSafeArea()
                        
                        ZStack {
                            VStack {
                                Spacer()
                                
                                Image("notifications")
                                    .resizable()
                                    .frame(height: 549)
                                    .ignoresSafeArea()
                                
                                Button {
                                    isNotificationView = false
                                    onboardingShowed = true
                                } label: {
                                    
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(height: 54)
                                            .foregroundColor(Color.onboardingBtn)
                                            .font(.system(size: 17, weight: .bold))
                                            .cornerRadius(16)
                                            .padding(.horizontal)
                                        Text("Enable notification").font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                                }.background(Color.onboardingBtn)
                                    .cornerRadius(18)
                                    .padding(.horizontal, 24)
                                    .padding(.bottom)
                                
                            }
                            VStack {
                                HStack {
                                    Spacer()
                                    Button {
                                        isNotificationView = false
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.black.opacity(0.3))
                                            Image(systemName: "xmark")
                                                .font(.system(size: 14, weight: .heavy))
                                                .foregroundColor(.white)
                                            
                                        }
                                    }
                                }.padding(.horizontal, 32)
                                Spacer()
                                Text("Don't miss anything \nimportant!")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(height: 70)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                            }.padding(.bottom, UIScreen.main.bounds.height * 2/2.6)
                        }
                    }
                    
                } else {
                    WebUIView(decodeString: decodeString)
                }
            }
        } else {
            WebUIView(decodeString: decodeString)
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
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}


#Preview {
    UsUIView(decodeString: "aHR0cHM6Ly9wb2RsYW9ybGYuc3BhY2UvUmtZVzF5eW0")
}
