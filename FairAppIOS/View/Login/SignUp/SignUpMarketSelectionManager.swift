//
//  NetworkManager.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/2/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

//import Alamofire
import Foundation
import Combine

class SignUpMarketSelectionManager: ObservableObject {
    
    @Published var stateList = ["NY", "AZ"]
    
    @Published var marketInfoList = [
        "NY": [
            "Syracuse": ["SYR_MARKET_1", "SYR_MARKET_2", "SYR_MARKET_3"],
            "Liverpool": ["LVP_MARKET_1","LVP_MARKET_2","LVP_MARKET_3"]
        ],
        
        "AZ": [
            "Tucson": ["TUC_MARKET_1", "TUC_MARKET_2", "TUC_MARKET_3"],
            "Phoenix": ["PHX_MARKET_1", "PHX_MARKET_2", "PHX_MARKET_3"]
        ]
    ]
    
    @Published var cityList_NY = ["Syracuse", "Liverpool", "New York"]
    @Published var cityList_AZ = ["Tucson", "Phoenix", "Tombstone"]
    @Published var marketList_SYR = ["SYR_MARKET_1", "SYR_MARKET_2", "SYR_MARKET_3"]
    @Published var marketList_TUC = ["TUC_MARKET_1", "TUC_MARKET_2", "TUC_MARKET_3"]
    @Published var marketList_PHX = ["PHX_MARKET_1", "PHX_MARKET_2", "PHX_MARKET_3"]
    
    @Published var loading = false
    
    @Published var selectedStateIndex = 0
    @Published var selectedCityIndex = 0
    @Published var selectedMarketIndex = 0
    
    var currentCityList: [String] = []
    var currentMarketList: [String] = []
    
    init() {
        loading = true
    }
    
    func setCityList(stateIndex: Int) {
        
        // reset temp list
        currentCityList = []
        
        if (stateList[stateIndex] == "NY") {
            
            //currentCitylist = cityList_NY
            
            for city in cityList_NY {
                currentCityList.append(city)
            }
            
        }
        else if (stateList[stateIndex] == "AZ") {
            
            for city in cityList_AZ {
                currentCityList.append(city)
            }
        }
    }
    
    func setMarketList(stateIndex: Int, cityIndex: Int) {
        
        // reset market list
        currentMarketList = []
        
        if (currentCityList[cityIndex] == "Syracuse") {
            
            for market in marketList_SYR {
                currentMarketList.append(market)
            }
        }
        else if (currentCityList[cityIndex] == "Tucson") {
            
            for market in marketList_TUC {
                currentMarketList.append(market)
            }
        }
        else if (currentCityList[cityIndex] == "Phoenix") {
            
            for market in marketList_PHX {
                currentMarketList.append(market)
            }
        }
    }
    /*
    @Published var movies = MovieList(results: [])
    @Published var loading = false
    private let api_key = ""
    private let api_url_base = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
    init() {
        loading = true
        loadDataByAlamofire()
    }
    
    private func loadDataNormal() {
        guard let url = URL(string: "\(api_url_base)\(api_key)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            let movies = try! JSONDecoder().decode(MovieList.self, from: data)
            DispatchQueue.main.async {
                self.movies = movies
                self.loading = false
            }
        }.resume()
    }
    
    private func loadDataByAlamofire() {
        Alamofire.request("\(api_url_base)\(api_key)")
            .responseJSON{ response in
                guard let data = response.data else { return }
                let movies = try! JSONDecoder().decode(MovieList.self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                    self.loading = false
                }
        }
    }
    */
}


