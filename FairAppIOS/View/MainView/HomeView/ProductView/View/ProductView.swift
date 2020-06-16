//
//  ProductView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/7/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct ProductView: View {
    
    // temp category for demo
    var tempCategoryColorMatch = ["cate-A":Color.red,
                        "cate-B":Color.orange,
                        "cate-C":Color.yellow,
                        "cate-D":Color.green,
                        "cate-E":Color.blue,
                        "cate-F":Color.gray,
                        "cate-G":Color.purple,
                        "cate-H":Color.black,
                        "cate-I":Color.pink]
    
    var tempCategory = ["cate-A","cate-B","cate-C","cate-D","cate-E","cate-F","cate-G","cate-H","cate-I"]
    
    
    var productList: [ProductListElement] = []
    
    var body: some View {
        //let keys = tempCategory.map{$0.key}
        //let values = tempCategory.map{$0.value}
        
        // main stack
        return VStack(spacing: 20) {
            GeometryReader { geometry in
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            
                            ForEach(self.tempCategory, id: \.self) { category in
                                ZStack{
                                    // set the background color
                                    self.tempCategoryColorMatch[category]
                                    
                                    // set the front color
                                    Text(category)
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .bold))
                                    .cornerRadius(5)
                                    .frame(width: 80, height: 50)
                                }
                            }
                        }
                    }   // Scroll View
                        .frame(width: geometry.size.width, height: 60)
                        //.position(x:0, y: 150)
                }   // geometry reader
            
            //
            
        }
        .padding()


    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
