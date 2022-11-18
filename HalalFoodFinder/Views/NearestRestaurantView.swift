//
//  NearestRestaurantView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 17/11/22.
//

import SwiftUI
import MapKit

struct NearestRestaurantView: View {
    @StateObject private var mapAPI = MapAPI()
    @State private var text = ""
       
    var body: some View {
      VStack {
         TextField("Enter an address", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
         
         Button("Find address") {
            mapAPI.getLocation(address: text, delta: 0.0025)
         }
         
         Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) { location in
             MapMarker(coordinate: location.coordinate, tint: Color.bgColor)
         }
         .ignoresSafeArea()
      }
    }
}

struct NearestRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NearestRestaurantView()
    }
}
