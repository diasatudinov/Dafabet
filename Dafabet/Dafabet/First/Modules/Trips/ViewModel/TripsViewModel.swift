//
//  TripsViewModel.swift
//  Dafabet
//
//  Created by Dias Atudinov on 31.07.2024.
//

import Foundation
import UIKit

class TripsViewModel: ObservableObject {
    @Published var trips: [Trip] = [] {
        didSet {
            saveTrips()
        }
    }
    
    private let tripsFileName = "trips.json"
    
    init() {
        loadTrips()
    }
    
    func viewDemo() {
        trips.append(Trip(imageData: UIImage(named: "demo1")?.jpegData(compressionQuality: 1.0), name: "Whistler Blackcomb", startDate: "03.02", endDate: "24.02", distance: "940.4", descents: [
            Descent(name: "Panorama", distance: "3.2", maxSpeed: "44", descentTime: "20", time: "15:00"),
            Descent(name: "Olympic descent", distance: "1.2", maxSpeed: "32", descentTime: "14", time: "16:40")
        ]))
        trips.append(Trip(imageData: UIImage(named: "demo2")?.jpegData(compressionQuality: 1.0), name: "Panorama Mountain Village", startDate: "19.03", endDate: "06.03", distance: "812.7", descents: [
            Descent(name: "Panorama", distance: "3.2", maxSpeed: "44", descentTime: "20", time: "15:00"),
            Descent(name: "Olympic descent", distance: "1.2", maxSpeed: "32", descentTime: "14", time: "16:40")
        ]))
    }
    
    func addTrip(for trip: Trip) {
        trips.append(trip)
    }
    
    func deleteTrip(for trip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips.remove(at: index)
        }
    }
    
    func addDescent(for trip: Trip, descent: Descent) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips[index].descents.append(descent)
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func tripsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(tripsFileName)
    }
    
    private func saveTrips() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.trips)
                try data.write(to: self.tripsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadTrips() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: tripsFilePath())
            trips = try decoder.decode([Trip].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
}
