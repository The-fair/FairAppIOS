//
//  TestHttpRequestFetch.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/10/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
