//
//  NearestRestaurantView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 17/11/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct NearestRestaurantView: View {
    @StateObject var mapManager = ContentViewModel()
    @Binding var data: [Restaurant]
    @StateObject var mapData = MapDataManager()
    var myLocation: CLLocation
       
    var body: some View {
      VStack {
          
          Map(coordinateRegion: $mapManager.region, showsUserLocation: true, annotationItems: mapData.location) { location in
                return MapMarker(coordinate: location.coordinate, tint: Color.bgColor)
          }
          .ignoresSafeArea(.all)
         
      }
      .onAppear {
          mapManager.checkIfLocationsServiceIsEnabled()
          self.data.sort(by: { $0.distance(to: myLocation) < $1.distance(to: myLocation) })
          mapData.getAllData(from: Array(data.prefix(upTo: 20)))
          
          
      }
    }
}

//struct NearestRestaurantView_Previews: PreviewProvider {
//    static var previews: some View {
////        NearestRestaurantView(data: [Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500")])
//    }
//}
