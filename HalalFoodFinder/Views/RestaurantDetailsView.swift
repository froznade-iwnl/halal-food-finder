//
//  RestaurantDetailsView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    var data: restaurant
    
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
                    
                    
                    
                }
                .padding(20)
                
                
                
            }
            
        }
        
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsView(data: restaurant(name: "7 Star Restaurant (Indian/Malay Food)", roadNumber: Optional(768), roadName: "UPPER SERANGOON ROAD", unitNumber: "02-03", buildingName: "-", postalCode: 534636, tags: "indian"))
    }
}
