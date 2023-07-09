//
//  ItemView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 03.12.20.
//

import SwiftUI

struct ItemView: View {
    
    let id: String
    @State var title: String
    @State var value: Bool
    static var restService: RestService!
    @State var isPresented:Bool = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .foregroundColor(value ? .green : .red)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    if let idInt: Int = Int(self.id) {
                        ItemView.restService.setItem(id: idInt, value: value ? 0 : 1) { result in
                            value = result != 0
                        }
                    }}
                .gesture(LongPressGesture(minimumDuration: 1)
                            .onEnded { _ in
                                print("Long press done")
                                isPresented = true
                            })
            Text(title).foregroundColor(.white)
        }
        .frame(maxWidth: 200, maxHeight: 200)
        .sheet(isPresented: $isPresented){return ChangeNameView(for: self.id,
                                                                with: $title,
                                                                isPresented: $isPresented) }
    }
    
    
}

struct ItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        return ItemView(id: "1", title: "Nummer 1", value: true)
    }
}

