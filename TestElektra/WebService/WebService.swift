//
//  WebService.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

final class WebService {
    
    static func getItemsListData() async throws -> ItemsList {
        
        let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp"
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ItemsList.self, from: data)
        } catch {
            throw ErrorCases.invalidData
        }
    }
}
