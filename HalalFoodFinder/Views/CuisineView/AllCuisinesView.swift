//
//  AllCuisinesView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI
import CoreLocation

struct AllCuisinesView: View {
    
    var data: [Restaurant]
    var myLocation: CLLocation
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(cuisines, id: \.self ) { cuisine in
                        
                        NavigationLink{
                            CuisineView(datas: data, tag: cuisine, myLocation: myLocation)
                        }label: {
                            VStack {
                                HStack {
                                    
                                    Image(cuisine)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 26)
                                    
                                    Text(cuisine.capitalized)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.bgColor)
                                }
                                .padding(12)
                                
                                Divider()
                            }
                            .padding(.top, 12)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Cuisines")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AllCuisinesView_Previews: PreviewProvider {
    
    static var previews: some View {
        AllCuisinesView(data: [Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500")], myLocation: CLLocation(latitude: 0, longitude: 0))
    }
}
