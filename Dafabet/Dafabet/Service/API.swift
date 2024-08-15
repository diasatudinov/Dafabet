//
//  API.swift
//  Dafabet
//
//  Created by Dias Atudinov on 15.08.2024.
//

import Foundation

class ApiService {
    private let baseUrl = "circuitcelestialalchemy.website"
    private let token = "3af2e924-fb5e-498d-8067-42f5027b1dd0"
    private let endURL = "d4fdsk1"
    init() {
        print("init")
    }
    func fetchData(completion: @escaping (Result<ApiResponse, Error>) -> Void) {
        guard let url = URL(string: "https://\(baseUrl)/app/\(endURL)") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        var request = URLRequest(url: url)
        //request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}


struct ApiResponse: Codable {
    let builder: String
    let city: [String]
    let region: [String]
    let isDefault: Bool
    let reflection: Int
    let unended: String
    let isLast: String
    let hasNoLink: String?
    let canCreate: [String]
    let collection: String
    let nonreplaceable: Int
    
    enum CodingKeys: String, CodingKey {
        case builder
        case city
        case region
        case isDefault = "is_default"
        case reflection
        case unended
        case isLast = "is_last"
        case hasNoLink = "has_no_link"
        case canCreate = "can_create"
        case collection
        case nonreplaceable
    }
}
