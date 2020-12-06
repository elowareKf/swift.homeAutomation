//
//  ContentView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import SwiftUI

struct ChangeNameView: View {
    
    var restService: RestService
    let id: Int
    @State private var name: String = ""
    
    init(for id: Int, with name: String) {
        restService = RestService()
        self.id = id
        self.name = name
    }
    
    var body: some View {
        VStack{
            Text("Name ändern")
                .font(.title)
            Spacer().frame(height: 20)
            Text("Aktueller Name: \(name)")
            TextField("Name", text: $name)
            HStack{
                Button("Speichern"){
                    
                }
                Button("Abbrechen"){
                    
                }
            }
        }.padding()
    }
}

struct ChangeNameView_Previews: PreviewProvider {
    
    static var previews: some View {
        return ChangeNameView(for: 1, with: "Test")
    }
}
