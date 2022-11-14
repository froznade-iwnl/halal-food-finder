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
            
            Image(systemName: "chevron.right")
                .foregroundColor(.bgColor)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .multilineTextAlignment(.leading)
        
        
    }
}

struct RestaurantFilteredMemberView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFilteredMemberView(name: "testing", postalCode: 123123, roadName: "testingtestingtesting")
    }
}
