//
//  HomeView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @Binding var tabSelection: Int
    @Binding var data: [Restaurant]
    @StateObject var mapManager = ContentViewModel()
    var myLocation: CLLocation
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgColor
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    ZStack {
                        
                        Color.bgColor
                            .ignoresSafeArea(.all)
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.white)
                            .ignoresSafeArea(.all)
                            .offset(y:200)
                            .ignoresSafeArea(.all)
                        
                    
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading){
                                    
                                    Text("\(greetingLogic()) 👋🏻")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                        .padding(.top, 20)
                                        .padding(.vertical, 20)
                                }
                                
                                Spacer()
                            }
                            .padding(.bottom)
                            
                            //Large Banner View
                            
                            NavigationLink {
                                RestaurantDetailsView(data: data[0])
                            } label: {
                                LargeBannerView(tag: data[0].tags, name: data[0].name, distance: 50, address: data[0].address)
                                    .padding(.bottom, 20)
                            }
                            
                            //Specific Cuisines
                            
                            HStack {
                                Text("Cuisines 🍱")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                NavigationLink {
                                    AllCuisinesView(data: data, myLocation: myLocation)
                                } label: {
                                    Text("More")
                                        .padding(.horizontal)
                                        .foregroundColor(.bgColor)
                                        .background {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.bgColor, lineWidth: 1)
                                        }
                                }
                            }
                            .padding(.top)
                            
                            
                            //Cuisines Button
                            ScrollView(.horizontal){
                                HStack {
                                    ForEach(cuisines.prefix(upTo: 5), id: \.self){ cuisine in
                                        
                                        NavigationLink {
                                            CuisineView(datas: data, tag: cuisine, myLocation: myLocation)
                                        } label: {
                                            CuisineSelectView(name: cuisine, color: .black)
                                        }

                                    }
                                }
                                .padding(2)
                            }
                            .padding(.bottom, 20)
                            
                            
                            //Near Me Part
                            HStack {
                                Text("Recommendations ✨")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Button(action: {
                                    tabSelection = 2
                                }, label: {
                                    Text("See All")
                                        .padding(.horizontal)
                                        .foregroundColor(.bgColor)
                                        .background {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.bgColor, lineWidth: 1)
                                        }
                                })
                            }
                            .padding(.top)
                            
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    
                                    if(data.count >= 5) {
                                        ForEach(data.prefix(upTo: 5)) { datum in
                                            NavigationLink {
                                                RestaurantDetailsView(data: datum)
                                            } label: {
                                                NearMeView(address: datum.address, name: datum.name, tag: datum.tags)
                                            }
                                        }
                                    }else{
                                        ForEach(data) { datum in
                                            NavigationLink {
                                                RestaurantDetailsView(data: datum)
                                            } label: {
                                                NearMeView(address: datum.address, name: datum.name, tag: datum.tags)
                                            }
                                        }
                                    }
                                    
                                }
                                .padding(2)
                            }
                            
                            
                        }
                        .padding(.horizontal, 20)
                        
                    }
                }
            }
            .onAppear {
                self.data.sort(by: { $0.distance(to: myLocation) < $1.distance(to: myLocation) })
            
                
            }
        }
    }
    
    func greetingLogic() -> String {
      let hour = Calendar.current.component(.hour, from: Date())
      
      let NEW_DAY = 0
      let NOON = 12
      let SUNSET = 18
      let MIDNIGHT = 24
      
      var greetingText = "Hello" // Default greeting text
      switch hour {
      case NEW_DAY..<NOON:
          greetingText = "Good Morning"
      case NOON..<SUNSET:
          greetingText = "Good Afternoon"
      case SUNSET..<MIDNIGHT:
          greetingText = "Good Evening"
      default:
          _ = "Hello"
      }
      
      return greetingText
    }
    
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(tabSelection: 1, data: [Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500")])
//    }
//}
