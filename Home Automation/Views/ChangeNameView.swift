//
//  ContentView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import SwiftUI

struct ChangeNameView: View {
    
    var restService: RestService
    let id: String
    @Binding private var name: String
    @Binding var isShown: Bool
    
    init(for id: String, with name: Binding<String>, isPresented: Binding<Bool>) {
        restService = RestService()
        self.id = id
        self._isShown = isPresented
        self._name = name
    }
    
    var body: some View {
        VStack{
            Text("Name ändern")
                .font(.title)
            Spacer().frame(height: 20)
            TextField("Name", text: $name)
            HStack{
                Button("Speichern"){
                    restService.nameItem(id: self.id, name: self.name)
                    self.isShown = false
                }
            }
        }.padding()
    }
}

struct ChangeNameView_Previews: PreviewProvider {
    @State(initialValue: true) static var shown: Bool
    @State(initialValue: "Titel") static var name: String

    static var previews: some View {
        return ChangeNameView(for: "1", with: $name, isPresented: $shown)
    }
}
