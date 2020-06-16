//
//  NetworkConstant.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/10/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation


struct NetworkConstants {
    
    struct DatabaseConstants {
        static let BaseIpAddr = "http://34.86.159.162"
        static let Colon = ":"
        static let PortNumber = "3000"
        static let ApiRoute = "/api"
    }
    
    struct VendorCollectionConstants {
        static let BaseRoute = "/vendors"
        static let AddNewVendorRoute = "/newvendor"
        static let GetVendorByEmailRoute = "/getVendorByEmail"
        static let GetVendorList = "/getVendorList"
    }
}
