//
//  Product.swift
//  MVArchitechture
//
//  Created by Aris on 12/09/24.
//

import Foundation

struct Product:Decodable,Identifiable {
    let id:     Int
    let title:  String
    let price:  Double
}
