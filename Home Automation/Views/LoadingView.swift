
//
//  LoadingView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import SwiftUI


struct LoadingView: View{
    
    var restService: RestService
    @State private var items: [Item]? = nil
    
    init() {
        restService = RestService()
        ItemView.restService = restService
    }
    
    
    var body: some View{
        if (items != nil){
            ScrollView{
                VStack{
                    LazyVGrid(columns: [GridItem(.flexible()),
                                        GridItem(.flexible()),
                                        GridItem(.flexible())], content: {
                        ForEach(self.items!) { item in
                            ItemView(title: item.name, id: String(item.id), value: item.value != 0)
                        }
                    })
                }
            }
        }else{
            VStack{
                ProgressView().onAppear(perform: loadItems)
                Text("Lade Geräte...")
            }
        }
    }
    
    func loadItems(){
        restService.getItems(callback: { (items: ItemResult) in
            self.items = items.toItems()
        })
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        return LoadingView()
    }
}



