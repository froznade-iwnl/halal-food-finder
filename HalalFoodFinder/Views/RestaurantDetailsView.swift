//
//  RestaurantDetailsView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI
import CoreLocation

struct RestaurantDetailsView: View {
    
    var data: restaurant
    @State var locationCoordinate: [Double] = []
    @StateObject private var mapAPI = MapAPI()
    
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
                            
                            Text("\(mapAPI.distance.formatted(.number.precision(.fractionLength(0))))m")
                                .foregroundColor(.white)
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
                    
                    MapView(address: data.getAddress())
                        .frame(height: 200)
                    
                    Text("\(data.roadName), \(data.postalCode)".capitalized)
                        .font(.caption)
                        .foregroundColor(.blue)
                        .underline()
                    
                }
                .padding(20)
                
                
                
            }
            
        }.onAppear {
            mapAPI.getLocation(address: data.getAddress(), delta: 0.0025)
        }
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsView(data: restaurant(name: "7 Star Restaurant (Indian/Malay Food)", roadNumber: "768", roadName: "UPPER SERANGOON ROAD", unitNumber: "02-03", buildingName: "-", postalCode: 534636, tags: "indian"))
    }
}
