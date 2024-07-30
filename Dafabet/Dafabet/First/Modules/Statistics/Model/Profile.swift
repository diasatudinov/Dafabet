//
//  Profile.swift
//  Dafabet
//
//  Created by Dias Atudinov on 30.07.2024.
//

import SwiftUI

struct Profile: Codable {
    var id = UUID()
    var imageData: Data?
    var name: String
    var level: String
    var recorded: String
    var avgSpeed: String
    var maxSpeed: String
    var distance: String
    var time: String
    var peakAlt: String
    var longestRun: String
    
    enum CodingKeys: String, CodingKey {
        case id, imageData, name, level, recorded, avgSpeed, maxSpeed, distance, time, peakAlt, longestRun
    }
    
    var image: UIImage? {
        get {
            guard let data = imageData else { return nil }
            return UIImage(data: data)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
}
