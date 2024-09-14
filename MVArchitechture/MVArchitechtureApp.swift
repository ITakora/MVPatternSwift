//
//  MVArchitechtureApp.swift
//  MVArchitechture
//
//  Created by Aris on 12/09/24.
//

import SwiftUI

@main
struct MVArchitechtureApp: App {
    
    @StateObject private var storeModel = StoreModel(webservice: WebService())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
