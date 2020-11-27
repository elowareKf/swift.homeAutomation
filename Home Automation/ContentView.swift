//
//  ContentView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import SwiftUI

struct ContentView: View {

    var restService: RestService

    init() {
        restService = RestService()
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
                })
            }
            LazyHGrid(rows: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Rows@*/[GridItem(.fixed(20))]/*@END_MENU_TOKEN@*/) {
                ItemView(title: "Haustüre", id: "0")
                ItemView(title: "Haustüre", id: "0")
                ItemView(title: "Haustüre", id: "0")

            }
        }
    }
}


struct ItemView: View {

    let title: String
    let id: String

    var body: some View {
        Button("Name", action: { () -> Void in
            print("Starting \(id)")

        })
                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
