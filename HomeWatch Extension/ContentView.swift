//
//  ContentView.swift
//  HomeWatch Extension
//
//  Created by Klaus Fischer on 04.12.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
        LazyVGrid(columns: [
            GridItem(),GridItem()
        ], content: {
            ItemView(title:"Nummer 1", id: "", value: true)
            ItemView(title:"Nummer 1", id: "", value: false)
            ItemView(title:"Nummer 1", id: "", value: true)
            ItemView(title:"Nummer 1", id: "", value: false)
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
