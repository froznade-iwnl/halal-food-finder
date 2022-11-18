//
//  RestaurantFilteredMemberView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import SwiftUI

struct RestaurantFilteredMemberView: View {
        
    var name: String
    var postalCode: Int
    var roadName: String
    @State var data: restaurant
    @StateObject private var mapAPI = MapAPI()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(name.capitalized)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                Text("\(roadName), \(postalCode)".capitalized)
                    .padding(.top, 2)
                    .foregroundColor(.black)
    
            }
            
            if(mapAPI.distance >= 1000) {
                Text("\((mapAPI.distance/1000).formatted(.number.precision(.fractionLength(1))))km")
            }else{
                Text("\(mapAPI.distance.formatted(.number.precision(.fractionLength(1))))m")
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.bgColor)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .multilineTextAlignment(.leading)
        .onAppear {
            mapAPI.getLocation(address: data.getAddress(), delta: 0.0025)
            
//            if(data.distance == -1) {
//                data.distance = mapAPI.distance
//            }
        }
        
        
    }
}

struct RestaurantFilteredMemberView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFilteredMemberView(name: "testing", postalCode: 123123, roadName: "testingtestingtesting", data: restaurant(name: "7 Star Restaurant (Indian/Malay Food)", roadNumber: "768", roadName: "UPPER SERANGOON ROAD", unitNumber: "02-03", buildingName: "-", postalCode: 534636, tags: "indian"))
    }
}
