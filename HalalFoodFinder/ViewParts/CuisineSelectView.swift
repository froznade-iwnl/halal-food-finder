//
//  CuisineView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 5/11/22.
//

import SwiftUI

struct CuisineSelectView: View {
    
    var name: String
    var color: Color
    
    
    var body: some View {
        VStack{
            
            Image(name.lowercased())
                .resizable()
                .scaledToFit()
            
            Text(name.capitalized)
                .font(.headline)
                .foregroundColor(.black)
                        
        }
        .padding()
        .frame(width: 116, height: 116)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            }
               
        }
    }
    
}

struct CuisineSelectView_Previews: PreviewProvider {
    static var previews: some View {
        CuisineSelectView(name: "Japanese", color: .black)
    }
}
