//
//  MarketSearchView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/2/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct MarketSearchView: View {
    
    @ObservedObject var networkManager = SignUpMarketSelectionManager()
    
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //@State var selectedState: String
    //@State var selectedCity: String
    //@State var selectedMarket: String
    //@State var addedMarketList: [String]
    
    @Binding var showModal: Bool
    
    //@Binding var selectedState: String
    //@Binding var selectedCity: String
    //@Binding var selectedMarket: String
    
    @Binding var addedMarketList: [String]

    var count = 0
    
    var body: some View {
        VStack{
            StateDropDownMenu()
            
            //Text("hello")
            
            Button("Add Market") {
                self.addedMarketList.append("market \(Date())")
                self.showModal.toggle()
            }
        }
    }
}

struct StateDropDownMenu: View {
    
    @ObservedObject var networkManager = SignUpMarketSelectionManager()
    
    @State private var selectedStateIndex = 0
    @State private var selectedCityIndex = 0
    @State private var selectedMarketIndex = 0
    
    //@State private var stateSelection = 0
    //@State private var citySelection = 0
    //@State private var marketSelection = 0
    
    @State private var statePickerVisible = false
    @State private var cityPickerVisible = false
    @State private var marketPickerVisible = false

    
    var body: some View {

        VStack {
            Text("Market Picker")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            List {
                
                // state drop down menu
                HStack {
                    Text("State")
                    Spacer()
                    if networkManager.stateList.count > 0 {
                        Button(networkManager.stateList[selectedStateIndex]) {
                            self.statePickerVisible.toggle()
                            //self.cityPickerVisible.toggle()
                            //self.marketPickerVisible.toggle()
                            
                        }
                        .foregroundColor(self.statePickerVisible ? .red : .blue)
                    }
                }
                
                if statePickerVisible {
                    HStack {
                        Spacer()
                        Picker(selection: $selectedStateIndex, label: Text("")) {
                            ForEach(0 ..< self.networkManager.stateList.count) {
                                Text(self.networkManager.stateList[$0]).foregroundColor(.secondary)
                            }
                        }
                        .onTapGesture {
                            self.networkManager.setCityList(stateIndex: self.selectedStateIndex)

                            self.statePickerVisible.toggle()
                            //self.cityPickerVisible.toggle()
                            //self.marketPickerVisible.toggle()
                        }
                        Spacer()
                    }
                }
                
                
                // City drop down menu
                HStack {
                    Text("City")
                    Spacer()
                    if networkManager.currentCityList.count > 0 {
                        Button(networkManager.currentCityList[selectedCityIndex]) {
                            
                            //self.statePickerVisible.toggle()
                            self.cityPickerVisible.toggle()
                            //self.marketPickerVisible.toggle()
                        }
                        .foregroundColor(self.cityPickerVisible ? .red : .blue)
                    }
                }
                
                if cityPickerVisible {
                    HStack {
                        Spacer()
                        Picker(selection: $selectedCityIndex, label: Text("")) {
                            ForEach(0 ..< self.networkManager.currentCityList.count) {
                                Text(self.networkManager.currentCityList[$0]).foregroundColor(.secondary)
                            }
                        }
                        .onTapGesture {
                            self.networkManager.setMarketList(stateIndex: self.selectedStateIndex, cityIndex: self.selectedCityIndex)
                            //self.count += 1
                            
                            //self.statePickerVisible.toggle()
                            self.cityPickerVisible.toggle()
                            //self.marketPickerVisible.toggle()
                        }
                        Spacer()
                    }
                }
                
                // Market drop down menu
                HStack {
                    Text("Market")
                    Spacer()
                    if networkManager.currentMarketList.count > 0 {
                        Button(networkManager.currentMarketList[selectedMarketIndex]) {
                            
                            //self.statePickerVisible.toggle()
                            //self.cityPickerVisible.toggle()
                            self.marketPickerVisible.toggle()
                        }
                        .foregroundColor(self.marketPickerVisible ? .red : .blue)
                    }

                }
                
                if marketPickerVisible {
                    HStack {
                        Spacer()
                        Picker(selection: $selectedMarketIndex, label: Text("")) {
                            ForEach(0 ..< self.networkManager.currentMarketList.count) {
                                Text(self.networkManager.currentMarketList[$0]).foregroundColor(.secondary)
                            }
                        }
                        .onTapGesture {

                            //self.statePickerVisible.toggle()
                            //self.cityPickerVisible.toggle()
                            self.marketPickerVisible.toggle()
                        }
                        Spacer()
                    }
                }
            }
            .padding() // VStack
        }
    }
}

    
   






struct MarketSearchView_Previews: PreviewProvider {
    //@Binding var selectedState: String
    //@Binding var selectedCity: String
    //@Binding var selectedMarket: String
    
    static var previews: some View {
        //MarketSearchView(selectedState: self.$selectedState, selectedCity: self.$selectedCity, selectedMarket: self.$selectedMarket)
        //MarketSearchView(showModal: .constant(true), selectedState: .constant(""), selectedCity: .constant(""), selectedMarket: .constant(""), addedMarketList: .constant([]))
        MarketSearchView(showModal: .constant(true), addedMarketList: .constant([]))
    }
}

