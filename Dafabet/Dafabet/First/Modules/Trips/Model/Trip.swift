//
//  Trip.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import SwiftUI

struct Trip: Identifiable, Hashable, Codable {
    var id = UUID()
    var imageData: Data?
    var name: String
    var startDate: String
    var endDate: String
    var distance: String
    var descents: [Descent]
    
    enum CodingKeys: String, CodingKey {
        case id, imageData, name, startDate, endDate, distance, descents
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

struct Descent: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var distance: String
    var maxSpeed: String
    var descentTime: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, distance, maxSpeed, descentTime
    }
}
