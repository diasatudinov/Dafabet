//
//  ProfileViewModel.swift
//  Dafabet
//
//  Created by Dias Atudinov on 30.07.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile = Profile(name: "Username", level: "", recorded: "0.0", avgSpeed: "0.0", maxSpeed: "0.0", distance: "0.0", time: "00:00:00", peakAlt: "0.0", longestRun: "0.0") {
        didSet {
            saveProfile()
        }
    }
    
    private let profileFileName = "profile.json"
    
    init() {
        loadProfile()
    }
    
    func saveProfile(_ profile: Profile) {
        self.profile = profile
    }
   
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func profileFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(profileFileName)
    }
    
    private func saveProfile() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.profile)
                try data.write(to: self.profileFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadProfile() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: profileFilePath())
            profile = try decoder.decode(Profile.self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    
    
}
