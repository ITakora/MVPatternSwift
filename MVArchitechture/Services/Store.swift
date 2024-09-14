//
//  WebService.swift
//  MVArchitechture
//
//  Created by Aris on 12/09/24.
//

import Foundation

enum NetworkError:Error {
    case badURL
    case badRequest
}


@MainActor
class Store:ObservableObject {
    
    @Published var products:[Product] = []
    
    func fetchData() async throws {
    
        let (data, response) = try await URLSession.shared.data(from: Constants.allProductsURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        self.products = try JSONDecoder().decode([Product].self, from: data)
        
    }
    
}
