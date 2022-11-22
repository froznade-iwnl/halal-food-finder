//
//  RestaurantFilteredMemberView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import SwiftUI

struct RestaurantFilteredMemberView: View {
        
    var name: String
    var address: String
    @State var data: Restaurant
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(name.capitalized)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                Text(address.capitalized)
                    .padding(.top, 2)
                    .foregroundColor(.black)
    
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
        RestaurantFilteredMemberView(name: "testing", address: "123123 testingtestingtesting", data: Restaurant(id: 0, name: "testing", tags: "test", address: "testingtestingtesting", latitude: "0.12312312", longitude: "103.124934"))
    }
}
