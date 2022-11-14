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
                    Text(name)
                        .font(.headline)
                    Spacer()
                }
                Text("\(roadName), \(postalCode)")
                    .padding(.top, 2)
    
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.bgColor)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        
    }
}

struct RestaurantFilteredMemberView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFilteredMemberView(name: "testing", postalCode: 123123, roadName: "testingtestingtesting")
    }
}
