//
//  ContentView.swift
//  HomeWatch Extension
//
//  Created by Klaus Fischer on 04.12.20.
//

import SwiftUI

struct ContentView: View {
    
    let restService: RestService = RestService()
    @State private var items: [Item]? = nil
    
    init() {
        ItemView.restService = self.restService
    }
    
    func loadItems(){
        restService.getItems(callback: { (items: ItemResult) in
            self.items = items.toItems()
        })
    }
    
    var body: some View {
        if self.items != nil{
            ScrollView{
                LazyVGrid(columns: [
                    GridItem(),GridItem()
                ], content: {
                    ForEach(self.items!) { item in
                        ItemView(id: String(item.id), title: item.name, value: item.value != 0)
                    }
                })
            }
        }
        else{
            VStack{
                ProgressView().onAppear(perform: loadItems)
                Text("Lade Geräte")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
