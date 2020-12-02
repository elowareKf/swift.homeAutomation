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

    init() {
        restService = RestService()
        ItemView.restService = restService
    }

    var body: some View {

        VStack {
            Button("Laden") {
                print("Lade daten...")
                RestService().getItems(callback: { (items: ItemResult) in
                    print("Data received")
                    for name in items.names {
                        print(name)
                    }
                    self.items = items.toItems()
                })
            }
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], content: {
                ForEach(items){ item in
                    ItemView(title: item.name, id: String(item.id), value: item.value != 0)
                }
            })
        }
    }
}


struct ItemView: View {
    
    let title: String
    let id: String
    @State var value: Bool
    static var restService: RestService!

    var body: some View {
        Button(title, action: { () -> Void in
            if let idInt: Int = Int(self.id){
                ItemView.restService.setItem(id: idInt, value: value ? 0 : 1){result in value = result != 0}
            }
        })
        .border(Color.black, width: 1.0)
    }


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
