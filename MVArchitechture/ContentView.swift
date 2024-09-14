//
//  ContentView.swift
//  MVArchitechture
//
//  Created by Aris on 12/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    
    private func fetchData () async {
        do {
            try await storeModel.populateProduct()
        }catch {
            print(error)  
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello World")
            
            List(storeModel.products) { product in
                VStack(alignment: .center){
                    Text(product.title)
                    Text("\(product.price)")
                    
                }.frame(maxWidth: .infinity, idealHeight: 200)
            }.listRowSpacing(10)
                
            
        }.task {
            await fetchData()
        }
       
    }
}

#Preview {
    ContentView().environmentObject(StoreModel(webservice: WebService()))
}
