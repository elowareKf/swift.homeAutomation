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

    func getButtons(items from: ItemResult) -> [ItemView] {
        print("Data received")
        var controlItems = [ControlItem]()

        for index in 0..<from.names.count {
            let controlItem = ControlItem()
            controlItem.name = from.names[index]
            controlItem.id = index
            controlItems.append(controlItem)
        }

        for item in controlItems {
            print("\(item.id): \(item.name)")
        }
        return controlItems.map({ (item: ControlItem) in ItemView(controlItem: item) });
    }


    var body: some View {

        VStack {
            Button("Laden") {
                print("Lade daten...")
                RestService().getItems(callback: { (items: ItemResult) in getButtons(items: items) })
            }
        }
    }


    struct ItemView: View {

        let title: String
        let id: Int
        var value: Bool = false

        init(controlItem: ControlItem) {
            self.title = controlItem.name
            self.id = controlItem.id
        }

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
}
