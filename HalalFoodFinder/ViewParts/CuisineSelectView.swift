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
        ZStack{
            
            Image(name.lowercased())
                .resizable()
                .scaledToFill()
            
            Text(name.capitalized)
                .font(.headline)
                .foregroundColor(.white)
                        
        }
        .padding()
        .frame(width: 116, height: 116)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.bgColor)
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
