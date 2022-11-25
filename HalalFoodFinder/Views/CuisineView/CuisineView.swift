//
//  CuisineView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import SwiftUI

struct CuisineView: View {
    
    @State var datas: [Restaurant]
    var tag: String
    
    var body: some View {
        VStack {
            
            if(datas.count == 0) {
                
                VStack {
                    
                    
                    
                    Text("No restaurant found")
                        .font(.title)
                        .bold()
                    
                    Text("But you can still find other restaurants, try to search for other type of cuisine.")
                        .multilineTextAlignment(.center)
                        .italic()
                        .padding(.top, 2)
                    
                    
                    
                }
                .foregroundColor(.gray)
                
            }else{
                
                ScrollView {
                    ForEach((datas.count >= 50 ? Array(datas.prefix(upTo: 50)): datas)) { data in
                        
                        NavigationLink {
                            RestaurantDetailsView(data: data)
                        } label: {
                            VStack {
                                RestaurantFilteredMemberView(name: data.name, address: data.address, data: data)
                                
                                Divider()
                            }
                        }
                    }
                }
            }
        }
        .onAppear{
            self.datas = datas.filter({ data in
                data.tags.lowercased().contains(tag.lowercased())
            })
        }
        .padding(20)
        .navigationTitle(tag.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CuisineView_Previews: PreviewProvider {
    static var previews: some View {
        CuisineView(datas: [Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500"), Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500"), Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500")], tag: "western")
        CuisineView(datas: [], tag: "test")
    }
}
