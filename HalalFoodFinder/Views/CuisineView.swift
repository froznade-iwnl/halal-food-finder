//
//  CuisineView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import SwiftUI

struct CuisineView: View {
    
    @State var datas: [restaurant]
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
                    ForEach(datas) { data in
                        
                        NavigationLink {
                            RestaurantDetailsView(data: data)
                        } label: {
                            VStack {
                                RestaurantFilteredMemberView(name: data.name, postalCode: data.postalCode, roadName: data.roadName)
                                
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
        .navigationTitle(tag)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CuisineView_Previews: PreviewProvider {
    static var previews: some View {
        CuisineView(datas: [restaurant(name: "try", roadName: "testing", unitNumber: "testing", buildingName: "testingtesting", postalCode: 123431, tags: "testing"),restaurant(name: "try2", roadName: "testing2", unitNumber: "testing2", buildingName: "testingtesting2", postalCode: 123432, tags: "testing2"), restaurant(name: "try3", roadName: "testing3", unitNumber: "testing3", buildingName: "testingtesting3", postalCode: 123433, tags: "testing3")], tag: "test")
        CuisineView(datas: [], tag: "test")
    }
}
