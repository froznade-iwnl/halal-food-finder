//
//  NearestRestaurantView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 17/11/22.
//

import SwiftUI
import MapKit

struct NearestRestaurantView: View {
    @State private var text = ""
       
    var body: some View {
      VStack {
         TextField("Enter an address", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
         
      }
    }
}

struct NearestRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NearestRestaurantView()
    }
}
