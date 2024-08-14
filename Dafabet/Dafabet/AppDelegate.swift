//
//  AppDelegate.swift
//  Dafabet
//
//  Created by Dias Atudinov on 01.08.2024.
//

import Foundation

import UIKit
import OneSignalFramework
import ApphudSDK
import AppMetricaCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        Apphud.start(apiKey: "app_pQuobp7szCwmHAavfpxfCwJ99x9PoQ")
//        OneSignal.initialize("fa08f781-2103-42d1-b0c6-4dcb52f602e1", withLaunchOptions: launchOptions)
//        OneSignal.login(Apphud.userID())
//        
//        let configuration = AppMetricaConfiguration.init(apiKey: "9344a3fa-3189-475a-ac84-aa112364bc45")
//        AppMetrica.activate(with: configuration!)

        
        print("AppDelegate: didFinishLaunchingWithOptions")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Handle app entering background
        print("AppDelegate: applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Handle app entering foreground
        print("AppDelegate: applicationWillEnterForeground")
    }
    
    // Implement other UIApplicationDelegate methods as needed
}
