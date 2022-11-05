//
//  ContentView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.bgColor
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading){
                            
                            Text("User")
                                .font(.body)
                                .foregroundColor(.white)
                                .padding(.top, 20)
                            
                            Text("Good Morning 👋🏻")
                                .foregroundColor(.white)
                                .font(.title)
                                .bold()
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    LargeBannerView(tag: "Food", name: "Restaurant Name", distance: 50, address: "random road")
                    
                }
                .padding(.horizontal, 20)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
