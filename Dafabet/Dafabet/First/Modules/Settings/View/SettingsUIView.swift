//
//  SettingsUIView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 29.07.2024.
//

import SwiftUI

struct SettingsUIView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(spacing: 0) {
                
                VStack {
                    Spacer()
                    HStack {
                        Text("Settings")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(16)
                }.frame(height: viewModel.standardNavBarHeight).padding(.bottom, 28)
                
                
                ScrollView {
                        VStack(spacing: 14) {
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(18)
                                    .foregroundColor(.white)
                                HStack {
                                    Button {
                                        viewModel.openUsagePolicy()
                                    } label: {
                                        HStack {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.red)
                                                    .cornerRadius(6)
                                                    .frame(width: 32, height: 32)
                                                Image(systemName: "doc.text.fill")
                                                    .foregroundColor(.background)
                                                    .font(.system(size: 16))
                                            }
                                            Text("Usage policy")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 17, weight: .semibold))
                                        }.padding()
                                    }
                                }
                            }
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(18)
                                    .foregroundColor(.white)
                                HStack {
                                    Button {
                                        viewModel.rateApp()
                                    } label: {
                                        HStack {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.red)
                                                    .cornerRadius(6)
                                                    .frame(width: 32, height: 32)
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.background)
                                                    .font(.system(size: 16))
                                            }
                                            Text("Rate Us")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 17, weight: .semibold))
                                        }.padding()
                                    }
                                }
                            }
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(18)
                                    .foregroundColor(.white)
                                HStack {
                                    Button {
                                        viewModel.shareApp()
                                    } label: {
                                        HStack {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.red)
                                                    .cornerRadius(6)
                                                    .frame(width: 32, height: 32)
                                                Image(systemName: "square.and.arrow.up.fill")
                                                    .foregroundColor(.background)
                                                    .font(.system(size: 16))
                                            }
                                            Text("Share App")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 17, weight: .semibold))
                                        }.padding()
                                    }
                                }
                            }
                        }.padding(.horizontal)
                }
                Spacer()
            }.padding(.bottom, 96)
                .ignoresSafeArea()
        }
    }
}


#Preview {
    SettingsUIView()
}
