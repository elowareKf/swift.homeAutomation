
//
//  LoadingView.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import SwiftUI


struct MainView: View{
    
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
                    Text("Home Automation")
                        .font(.title)
                    LazyVGrid(columns: [GridItem(.flexible()),
                                        GridItem(.flexible()),
                                        GridItem(.flexible())], content: {
                        ForEach(self.items!) { item in
                            ItemView(id: String(item.id), title: item.name, value: item.value != 0)
                        }
                    })
                }
            }
            .padding(.horizontal)
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


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        return MainView()
    }
}



