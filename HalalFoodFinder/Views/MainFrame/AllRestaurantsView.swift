//
//  AllRestaurantsView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI

struct AllRestaurantsView: View {
    @State var datas: [Restaurant]
    @State var searchedData: [Restaurant] = []
    @State private var key = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView {
                    ForEach(Array(datas.prefix(upTo: 70))) { data in
                        VStack {
                            
                            NavigationLink {
                                RestaurantDetailsView(data: data)
                            } label: {
                                RestaurantFilteredMemberView(name: data.name, address: data.address, data: data)
                            }
                            Divider()
                                .padding(.top, 2)
                        }
                    }
                }
            }
            .padding(20)
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $key, placement: .navigationBarDrawer(displayMode: .always)){
                ForEach(searchedData) { data in
                    NavigationLink {
                        RestaurantDetailsView(data: data)
                    }label:{
                        RestaurantFilteredMemberView(name: data.name, address: data.address, data: data)
                    }
                }
            }
            .onChange(of: key) { newData in
                self.searchedData = datas.filter({ data in
                    data.name.lowercased().contains(key.lowercased())
                })
            }
            
        }
    }
}

struct AllRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        AllRestaurantsView(datas: [Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500")])
    }
}
