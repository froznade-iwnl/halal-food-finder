//
//  RestaurantDetailsView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI
import CoreLocation

struct RestaurantDetailsView: View {
    @Environment(\.openURL) var openURL
    @State var data: Restaurant
    
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                ZStack {
                    Rectangle()
                        .frame(height: 200)
                        .foregroundColor(.bgColor)
                        .ignoresSafeArea(.all)
                    
                    Image("foodDoodles")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .opacity(0.05)
                        
                    
                    
                    
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
                    
                    Text("Take me there!")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    HStack {
                        Text(data.address)
                            .padding(.top, 5)
                        
                        Spacer()
                        
                        Button {
                            openURL(URL(string: "https://maps.google.com/?q=\(data.latitude),\(data.longitude)")!)
                        }label:{
                            
                            Image(systemName: "location.circle.fill")
                                .font(.title3)
                                .foregroundColor(.bgColor)
                                .padding(5)
                                .background{
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.bgColor, lineWidth: 1)
                                }
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 20)
                    
                    Text("How to get there?")
                        .font(.headline)
                        .foregroundColor(.black)
                        
                    
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
