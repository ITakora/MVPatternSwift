//
//  StoreModel.swift
//  MVArchitechture
//
//  Created by Aris on 12/09/24.
//

import Foundation

@MainActor
class StoreModel:ObservableObject {
    
    let webservice: WebService
    @Published var products:[Product] = []
    
    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    func populateProduct () async throws {
        products = try await webservice.fetchData()
    }
    
    
}
