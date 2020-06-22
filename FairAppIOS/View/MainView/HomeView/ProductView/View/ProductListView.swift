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
    
    //var productList: [ProductListElement]
    
    // **************************************************
    // function to generate a sample product list element
    // **************************************************
    func createProductListElementSample(index: String) -> ProductListElement {
        var product_A = ProductListElement()
        product_A.productTitle = "product_" + index
        product_A.unitPriceInDollarPerPound = index
        product_A.enableStatus = true
        product_A.tagCategory = tempCategory[Int(index)!]
        product_A.description = "sample description skjsljfdjslffjsklfdslfjklfdjslfdjslkfslfjdslkfjslkfjslkfjslkldsfkldjfklsd"
        product_A.descriptionExpand = false
        
        return product_A
    }
    
    // **************************************************
    // function to generate a sample product list
    // **************************************************
    func generateDemoProductList() -> [ProductListElement] {
        
        var productList: [ProductListElement] = []
        let count = 0...8
        for number in count {
            productList.append(createProductListElementSample(index: String(number)))
        }
        
        return productList
    }
    
    
    
    
    var body: some View {
        //let keys = tempCategory.map{$0.key}
        //let values = tempCategory.map{$0.value}
        
        let productListDemo = self.generateDemoProductList()
        
        // main stack
        return
            //NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    CategoryFilterbarView(tempCategoryColorMatch: self.tempCategoryColorMatch, tempCategory: self.tempCategory)
                        .frame(width: geometry.size.width, height: 50)
                    
                    Spacer()
                    
                    ProductRowView(productList: productListDemo)
                        .frame(width: geometry.size.width)
                }
                
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: ProductCreateView()){
                    Text("Add")
                }
        )
        //.onAppear(perform: self.generateDemoProductList)
        
        /*
         GeometryReader { geometry in
         //.position(x:0, y: 150)
         }   // geometry reader
         */
        
        /*
         Group {
         
         //.frame(width: geometry.size.width, height: 100)
         }
         */
        //
        
        
    }
    //}
}


struct CategoryFilterbarView: View {
    @State var tempCategoryColorMatch: [String: Color]
    @State var tempCategory: [String]
    
    var body: some View {
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
        //.frame(width: geometry.size.width, height: 60)
        
    }
}

struct ProductRowView: View {
    
    // inherit variable
    @State var productList: [ProductListElement]
    
    // on screen variable
    @State var unitPrice = ""
    @State var unitCategory = "Lb(s)"
    
    @State var productObjectId = ""
    
    
    var body: some View {
        //NavigationView {
        return List {
            ForEach(productList, id:\.id) { product in
                VStack(alignment: .leading) {
                    HStack(spacing: 5) {
                        
                        Image(systemName: "photo")
                        
                        // product title and price
                        VStack(spacing: 5) {
                            Text("\(product.productTitle)")
                            HStack{
                                Text("$")
                                Text("\(product.unitPriceInDollarPerPound)")
                                    .font(.system(size: 12))
                                    .padding(1)
                                //.background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 1))
                                Text("/")
                                Text("Lb(s)")
                            }   // HStack
                            
                            // Description
                            HStack {
                                Text("\(product.description)")
                            }
                            
                        }   // VStack
                            .padding()
                        
                        // tag, button and deletion button
                        VStack(spacing: 5) {
                            Image(systemName: "photo")
                                .resizable()
                            //.frame(width: 20, height: 20, alignment: .center)
                            //Spacer()
                            
                            NavigationLink(destination: ProductEditView(product: product)) {
                                Text("Edit")
                            }
                            
                            //Spacer()
                            
                            Button(action: {
                                self.deleteProductFromListById(objectID: product.productId)
                            }) {
                                Text("Delete")
                            }
                            //Toggle(isOn: )
                        }   // VStack
                            .padding()
                    }   //  HStack
                }   // VStack
            }
            
        }   // List
        //}   // Navigation
    }   // body
    
    // **************************************************
    // function to delete the product from the list
    // **************************************************
    func deleteProductFromListById(objectID: String) {
        
    }
}





struct ProductView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductView()
    }
}

