//
//  HomeView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var data: [restaurant]
    
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
                            
                            //Large Banner View
                            
                            LargeBannerView(tag: data[0].tags, name: data[0].name, distance: 50, address: data[0].roadName)
                                .padding(.bottom, 20)
                            
                            //Specific Cuisines
                            
                            HStack {
                                Text("Cuisines 🍱")
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                Button {
                                    print("Click!")
                                } label: {
                                    Text("See All")
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
                                    ForEach(cuisines, id: \.self){ cuisine in
                                        
                                        NavigationLink {
                                            CuisineView(datas: data, tag: cuisine)
                                        } label: {
                                            CuisineSelectView(name: cuisine, color: .black)
                                        }

                                    }
                                }
                            }
                            .padding(.bottom, 20)
                            
                            
                            //Near Me Part
                            HStack {
                                Text("Recommendation ✨")
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                Button {
                                    print("Click!")
                                } label: {
                                    Text("See All")
                                        .padding(.horizontal)
                                        .foregroundColor(.bgColor)
                                        .background {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.bgColor, lineWidth: 1)
                                        }
                                }
                            }
                            .padding(.top)
                            
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    
                                    if(data.count >= 5) {
                                        ForEach(data.prefix(upTo: 5)) { datum in
                                            NearMeView(roadname: datum.roadName, name: datum.name, tag: datum.tags)
                                        }
                                    }else{
                                        ForEach(data) { datum in
                                            NearMeView(roadname: datum.roadName, name: datum.name, tag: datum.tags)
                                        }
                                    }
                                    
                                }
                            }
                            
                            
                        }
                        .padding(.horizontal, 20)
                        
                    
                        
                    }
                }
            }.onAppear{
                self.data.shuffle()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(data: [restaurant(name: "7 Star Restaurant (Indian/Malay Food)", roadNumber: Optional(768), roadName: "UPPER SERANGOON ROAD", unitNumber: "02-03", buildingName: "-", postalCode: 534636, tags: "indian")])
    }
}
