//
//  TripsViewModel.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import Foundation
import UIKit

class TripsViewModel: ObservableObject {
    @Published var trips: [Trip] = []
    
    func viewDemo() {
        trips.append(Trip(imageData: UIImage(named: "demo1")?.jpegData(compressionQuality: 1.0), name: "Whistler Blackcomb", startDate: "03.02", endDate: "24.02", distance: "940.4", descents: []))
        trips.append(Trip(imageData: UIImage(named: "demo2")?.jpegData(compressionQuality: 1.0), name: "Panorama Mountain Village", startDate: "19.03", endDate: "06.03", distance: "812.7", descents: []))
    }
    
}
