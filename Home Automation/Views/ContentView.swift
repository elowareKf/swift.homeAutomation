//
//  ContentView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import SwiftUI

struct ContentView: View {
    
    var restService: RestService
    @State var items = [Item]()
    
    init(items: [Item]) {
        restService = RestService()
        ItemView.restService = restService
        
        self.items = items
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Geladen")
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
                ForEach(self.items) { item in
                    ItemView(title: item.name, id: String(item.id), value: item.value != 0)
                }
            })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static func generateDemoData() -> [Item]{
        var items = [Item]()
        items.append(Item(id: 1, name: "Nummer 1", value: 0))
        items.append(Item(id: 2, name: "Nummer 2", value: 1))
        items.append(Item(id: 3, name: "Nummer 3", value: 0))
        items.append(Item(id: 4, name: "Nummer 4", value: 1))
        items.append(Item(id: 5, name: "Nummer 5", value: 0))
        items.append(Item(id: 6, name: "Nummer 6", value: 1))
        items.append(Item(id: 7, name: "Nummer 7", value: 0))
        items.append(Item(id: 8, name: "Nummer 8", value: 1))
        items.append(Item(id: 9, name: "Nummer 9", value: 0))
        return items
    }
    
    static var previews: some View {
        return ContentView(items: generateDemoData())
    }
}
