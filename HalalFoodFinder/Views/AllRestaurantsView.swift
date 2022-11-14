//
//  AllRestaurantsView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI

struct AllRestaurantsView: View {
    @State var datas: [restaurant]
    @State var searchedData: [restaurant] = []
    @State private var key = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView {
                    ForEach(datas) { data in
                        VStack {
                            
                            NavigationLink {
                                RestaurantDetailsView(data: data)
                            } label: {
                                RestaurantFilteredMemberView(name: data.name, postalCode: data.postalCode, roadName: data.roadName)
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
                        RestaurantFilteredMemberView(name: data.name, postalCode: data.postalCode, roadName: data.roadName)
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
        AllRestaurantsView(datas: [restaurant(name: "7 Star Restaurant (Indian/Malay Food)", roadNumber: Optional(768), roadName: "UPPER SERANGOON ROAD", unitNumber: "02-03", buildingName: "-", postalCode: 534636, tags: "indian")])
    }
}
