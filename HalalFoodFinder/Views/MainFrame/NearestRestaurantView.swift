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
    @StateObject var mapManager = ContentViewModel()
    @State var data: [Restaurant]
    @StateObject var mapData = MapDataManager()
    @State var isClicked = false
       
    var body: some View {
      VStack {
          
          Map(coordinateRegion: $mapManager.region, showsUserLocation: true, annotationItems: mapData.location) { location in
                MapMarker(coordinate: location.coordinate, tint: Color.bgColor)
          }
          .ignoresSafeArea(.all)
         
      }
      .onAppear {
          mapManager.checkIfLocationsServiceIsEnabled()
          mapData.getAllData(from: Array(data.prefix(upTo: 20)), address: text)
      }
    }
}

struct NearestRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NearestRestaurantView(data: [Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500")])
    }
}
