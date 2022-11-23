//
//  RestaurantDetailsView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI
import CoreLocation

struct RestaurantDetailsView: View {
    
    @State var data: Restaurant
    
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                ZStack {
                    Rectangle()
                        .frame(height: 366)
                        .foregroundColor(.bgColor)
                        .ignoresSafeArea(.all)
                    
                    VStack{
                        Spacer()
                        
                        HStack {
                            Text(data.name)
                                .font(.title)
                                .foregroundColor(.white)
                                .bold()
                            
                            Spacer()
                            
                        }
                        
                        
                        
                    }
                    .padding(20)
                }
                
                VStack(alignment: .leading) {
                    Text("About")
                        .font(.headline)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquam efficitur leo, vel ornare justo porttitor luctus. Integer non dapibus nibh, ac elementum tortor. In eget elit non magna tempor.")
                        .padding(.top, 2)
                    
                    Text("How to get there?")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    MapView(data: data)
                        .frame(height: 200)
                    
                    
                    Text(data.address.capitalized)
                        .font(.caption)
                        .foregroundColor(.blue)
                        .underline()
                    
                }
                .padding(20)
                
                
                
            }
            
        }
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsView(data: Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500"))
    }
}
