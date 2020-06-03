//
//  TestContextMenu.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/2/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

struct TestContextMenuView: View {
    var body: some View {
        Text("Options")
            .contextMenu {
                Button(action: {
                    
                }) {
                    Text("Chooese Country")
                }
                
                Button(action: {
                    
                }) {
                    Text("Detect Location")
                }
        }
    }
}


// For preview usage


struct TestContextMenuView_Previews: PreviewProvider {

    
    static var previews: some View {
        TestContextMenuView()
    }
}

