//
//  ItemView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 03.12.20.
//

import SwiftUI

struct ItemView: View {

    let title: String
    let id: String
    @State var value: Bool
    static var restService: RestService!

    var body: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(value ? .green : .red)
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                
            Button(title, action: { () -> Void in
                if let idInt: Int = Int(self.id) {
                    ItemView.restService.setItem(id: idInt, value: value ? 0 : 1) { result in
                        value = result != 0
                    }
                }
            }).foregroundColor(.white)

        }
        
        
    }


}

struct ItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        return ItemView(title: "Nummer 1", id: "1", value: true)
    }
}

