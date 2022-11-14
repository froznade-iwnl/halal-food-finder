//
//  AllCuisinesView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI

struct AllCuisinesView: View {
    
    var data: [restaurant]
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(cuisines, id: \.self ) { cuisine in
                        
                        NavigationLink{
                            CuisineView(datas: data, tag: cuisine)
                        }label: {
                            VStack {
                                HStack {
                                    Text(cuisine)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.bgColor)
                                }
                                .padding(12)
                                
                                Divider()
                            }
                            .padding(.top, 12)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Cuisines")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AllCuisinesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCuisinesView(data: [restaurant(name: "7 Star Restaurant (Indian/Malay Food)", roadNumber: Optional(768), roadName: "UPPER SERANGOON ROAD", unitNumber: "02-03", buildingName: "-", postalCode: 534636, tags: "indian")])
    }
}
