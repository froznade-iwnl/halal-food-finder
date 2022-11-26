//
//  RestaurantFilteredMemberView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import SwiftUI
import CoreLocation

struct RestaurantFilteredMemberView: View {
        
    var name: String
    var address: String
    @State var data: Restaurant
    var location: CLLocation
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(name.capitalized)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                
                    Text(address.capitalized)
                        .foregroundColor(.black)
                        .padding(.top, 0.1)
                    
                    Spacer()
                    
            }
            .padding(.trailing)
            
            if(data.distance(to: location) <= 10000){
                if(data.distance(to: location) < 100){
                    Text("\(String(format: "%.1f", data.distance(to: location)))m")
                        .foregroundColor(.white)
                        .padding(7)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.bgColor)
                        }
                }else{
                    Text("\(String(format: "%.1f", data.distance(to: location)/1000)) km")
                        .foregroundColor(.white)
                        .padding(7)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.bgColor)
                        }
                }
            }else{
                Text(">10 km")
                    .foregroundColor(.white)
                    .padding(7)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.bgColor)
                            
                    }
              
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.bgColor)
                
            
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.leading)
        .onAppear {
            
        }
    }
}

struct RestaurantFilteredMemberView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFilteredMemberView(name: "testing", address: "123123 testingtestingtesting", data: Restaurant(id: 0, name: "testing", tags: "test", address: "testingtestingtesting", latitude: "0.12312312", longitude: "103.124934"), location: CLLocation(latitude: 0, longitude: 0))
    }
}
