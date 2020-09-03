//
//  UserProfileHttpRequest.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/10/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct VendorProfileHttpRequestResponse: Codable {
    var results: [VendorProfileHttpRequestResult]
}

struct VendorProfileHttpRequestResult: Codable {

    
    var pw: String
    var firstname: String
    var lastname: String
    var email: String
    var entityName: String
    var streetAddr: String
    var city: String
    var state: String
    var zipCode: String
    
}
