//
//  ContentView.swift
//  MVArchitechture
//
//  Created by Aris on 12/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: Store
    
    private func fetchData () async {
        do {
            try await storeModel.fetchData()
        }catch {
            print(error)  
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello World")
            
            List(storeModel.products) { product in
                VStack(){
                    Text(product.title).frame(maxWidth: .infinity).multilineTextAlignment(.center).padding(8)
                    Text("\(product.price)").frame(maxWidth: .infinity)
                    
                }.frame(height: 200)
            }.listRowSpacing(10)
                
            
        }.task {
            await fetchData()
        }
       
    }
}

#Preview {
    ContentView().environmentObject(Store())
}
