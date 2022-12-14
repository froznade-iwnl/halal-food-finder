//
//  LargeBannerView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 5/11/22.
//

import SwiftUI

struct LargeBannerView: View {
    
    var tag: String
    var name: String
    var distance: Int
    var address: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                
                
                Text("#\((tag == "" ? "MainCourse" : tag))")
                    .foregroundColor(.black)
                
                Spacer()
                
                
            }
            
            Spacer()
            
            HStack(alignment: .bottom) {
                Text(name)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .bold()
                
            }
            
            HStack {
                
                Image(systemName: "location")
                
                Text(address.capitalized)
                    .multilineTextAlignment(.leading)
                
            }
            .padding(.top, 2)
                
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
            Image("foodDoodles")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .opacity(0.05)
        }
        
    }
}

struct LargeBannerView_Previews: PreviewProvider {
    static var previews: some View {
        LargeBannerView(tag: "Food", name: "Restaurant Name", distance: 50, address: "random road")
    }
}
