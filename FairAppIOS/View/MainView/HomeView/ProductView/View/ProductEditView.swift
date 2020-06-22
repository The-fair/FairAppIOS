//
//  ProductEditView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/20/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import SwiftUI

struct ProductEditView: View {
    
    @State var product: ProductListElement
    
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
    
    @State var productTitle: String = ""
    @State var productUnitPrice: String = ""    // need validation
    @State var productDescription: String = ""
    @State var productEnabled: Bool = false
    
    
    
    
    var body: some View {
        return VStack {
            HStack {
                Image(systemName: "photo")
                VStack {
                    
                    Group {
                        TextField("\(product.productTitle)", text: self.$productTitle)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.black, lineWidth: 1))
                        HStack {
                            Text("Price: $")
                            TextField("\(product.unitPriceInDollarPerPound)", text: self.$productUnitPrice)
                                .font(.system(size: 14))
                                .autocapitalization(.none)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.black, lineWidth: 1))
                        }   // HStack
                    }
                    
                    
                    // Description
                    Group {
                        VStack {
                            Text("Description")
                            TextField("\(product.description)", text: self.$productDescription)
                                .font(.system(size: 14))
                                .autocapitalization(.none)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(Color.black, lineWidth: 1))
                        }
                    }
                    
                }   // VStack
                
                
            }   // HStack
            
            // Tag/Category
            Group {
                VStack {
                    Text("Tag as")
                    HStack {
                        ForEach(self.tempCategory[0...(self.tempCategory.count/2)], id: \.self) { category in
                            ZStack{
                                // set the background color
                                self.tempCategoryColorMatch[category]
                                
                                // set the front color
                                Text(category)
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .bold))
                                    .cornerRadius(5)
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }   // HStack
                    
                    HStack {
                        ForEach(self.tempCategory[self.tempCategory.count/2...(self.tempCategory.count - 1)], id: \.self) { category in
                            ZStack{
                                // set the background color
                                self.tempCategoryColorMatch[category]
                                
                                // set the front color
                                Text(category)
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .bold))
                                    .cornerRadius(5)
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }   // HStack
                }   // VStack
            }   // Tag Group
            
            Group {
                Toggle(isOn: $productEnabled) {
                    if self.productEnabled {
                        Text("Product Enabled")
                    }
                    else{
                        Text("Product Disabled")
                    }
                }
            }
            
            VStack {
                // Save button
                Button( action: {
                    self.saveChanges()
                }) {
                    Text("Save")
                }
                
                // reload original data from the cloud side
                Button( action: {
                    self.reloadData()
                }) {
                    Text("Restore")
                }
            }
        }   // VStack Main
    }   // body view
    
    // **************************************************
    // function to generate a sample product list
    // **************************************************
    func saveChanges() {
        print("Save the change to cloud side")
    }
    
    // **************************************************
    // function to generate a sample product list
    // **************************************************
    func reloadData() {
        print("Save the change to cloud side")
    }
}

/*
 struct ProductEditView_Previews: PreviewProvider {
 static var previews: some View {
 ProductEditView()
 }
 }
 */
