//
//  NearMeView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 5/11/22.
//

import SwiftUI

struct NearMeView: View {
    
    var address: String
    var name: String
    var tag: String
 
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack {
                Text("#\((tag == "" ? "MainCourse" : tag.capitalized))")
                    .font(.caption)
                
                Spacer()
            }
            
            Spacer()
            
            Text(name.capitalized)
                .font(.headline)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            
            Text(address.capitalized)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.top, 2)
            
        }
        .padding(20)
        .frame(width: 180, height: 300)
        .background{
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        }
        
        
        
    }
}

struct NearMeView_Previews: PreviewProvider {
    static var previews: some View {
        NearMeView(address: "test", name: "RestaurantName", tag: "fusion")
    }
}
