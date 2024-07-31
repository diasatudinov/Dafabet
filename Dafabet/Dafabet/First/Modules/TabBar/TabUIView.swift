//
//  TabUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 29.07.2024.
//

import SwiftUI

struct TabUIView: View {
    @State var selectedTab = 0
    private let tabs = ["Home", "Profile", "Settings"]
    
    @ObservedObject var profileVM = ProfileViewModel()
    @ObservedObject var tripsVM = TripsViewModel()
    
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case 0:
                StatisticsUIView(viewModel: profileVM)
            case 1:
                TripsUIView(viewModel: tripsVM)
            case 2:
                SettingsUIView()
            default:
                Text("default")
            }
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.background)
                            .frame(height: 80)
                            
                        HStack(spacing: 85) {
                            ForEach(0..<tabs.count) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    
                                    ZStack {
                                        
                                        Image(systemName: icon(for: index))
                                            .foregroundColor(selectedTab == index ? Color.onboardingBtn : Color.black.opacity(0.5))
                                            .font(.system(size: 20))
                                    }
                                }
                                
                            }
                        }.padding(.bottom, 25)
                        
                        Rectangle()
                            .fill(Color.black.opacity(0.1))
                            .frame(height: 0.7)
                            .padding(.bottom, 80)
                    }
                    
                }.ignoresSafeArea()
                .onAppear {
                    //AppMetrica.reportEvent(name: "did_show_main_screen")
                }
            
        }
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "list.bullet.rectangle.fill"
        case 1: return "mountain.2.fill"
        case 2: return "gearshape.2.fill"
        default: return ""
        }
    }
}

#Preview {
    TabUIView()
}
