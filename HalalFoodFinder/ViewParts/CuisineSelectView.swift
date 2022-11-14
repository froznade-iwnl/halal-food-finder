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
            
            Text(name.capitalized)
                .font(.headline)
                .foregroundColor(color)
            
        }
        .padding()
        .frame(width: 116, height: 116)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            }
               
        }
    }
}

struct CuisineSelectView_Previews: PreviewProvider {
    static var previews: some View {
        CuisineSelectView(name: "test", color: .black)
    }
}
