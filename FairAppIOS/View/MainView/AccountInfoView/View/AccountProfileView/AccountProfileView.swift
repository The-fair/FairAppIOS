//
//  ProfileView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/16/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseStorage

struct AccountProfileView: View {
    
    @EnvironmentObject var session: AuthSessionStore
    let FILE_NAME = "User/tangmac@live.cn/portrait_image/portrait_image_test.jpeg"
    
    
    @State var imageURL = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var gender = ""
    
    @State var birthDay = ""
    @State var birthDate = Date()
    
    
    private var dateProxy:Binding<Date> {
        Binding<Date>(get: {self.birthDate}, set: {
            self.birthDate = $0
            self.birthDay = self.convertDateToString(date: self.birthDate)
            
            print("\(self.birthDay)")
        })
    }
    
    
    @State var datePickerExpand = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        VStack {
            
            Group {
                VStack(spacing: 25) {
                    // display the image on the top
                    if imageURL != "" {
                        FirebaseImageView(imageURL: imageURL)
                    }
                    
                    HStack {
                        Text("First Name: ")
                        //LabelledDivider(label: "First Name")
                        TextField("First Name", text: $firstName)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Last Name: ")
                        //LabelledDivider(label: "First Name")
                        
                        TextField("Last Name", text: $lastName)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                    }
                    
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        Text("Date of Birth: ")
                        
                        Button(action: {
                            self.datePickerExpand.toggle()
                        }) {
                            TextField("Date of birth", text: $birthDay)
                                .font(.system(size: 14))
                                .autocapitalization(.none)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color.black, lineWidth: 1))
                                .disabled(true)
                            
                        }
                        
                        if (self.datePickerExpand == true) {
                            HStack(alignment: .bottom) {
                                DatePicker("", selection: self.dateProxy, displayedComponents: .date).labelsHidden()
                            }
                        .labelsHidden()
                            .overlay(
                                GeometryReader { pickerFrame in
                                    VStack {
                                        Button(action: {
                                            self.datePickerExpand.toggle()
                                        }) {
                                            Text("Done")
                                                .font(.system(size: 14))
                                                .foregroundColor(.black)
                                                .padding(.vertical)
                                                .frame(width: pickerFrame.size.width)
                                        }.background(Color.white)
                                        
                                        Spacer()
                                        
                                        
                                    }
                                    .frame(width: pickerFrame.size.width, height: pickerFrame.size.height - 15)
                                    //.border(Color.black, width: 8)
                                    
                            })  // overlay
                            //.padding(EdgeInsets.init(top: 50, leading: 10, bottom: 50, trailing: 10)).background(Color.gray.opacity(0.1))
                            //.onAppear(perform: self.endEditing)
                            //.onTapGesture(perform: self.endEditing)
                            
                        }
                    }
                    
                    
                    /*
                     DatePicker(selection: $birthDate, displayedComponents: .date) {
                     Text("Select a date")
                     }
                     */
                }
            }
            
            Spacer(minLength: 50)
            
            //
            Group {
                VStack {
                    
                    // save button to upload the changes
                    Button(action: {
                        print("Save")
                    }) {
                        Text("Save")
                    }
                    
                    // cancel button to reload the information
                    Button(action: {
                        print("reload")
                    }) {
                        Text("Cancel")
                    }
                }
            }
            
        }   // VStack
        .onAppear(perform: loadData).animation(.spring())
        
    }   // body view
    
    // **************************************************
    //  fucntion to convert date object into string
    // **************************************************
    func convertDateToString(date: Date) -> String {
        //var rtnStr: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let rtnStr = dateFormatter.string(from: date)
        
        return rtnStr
    }
    
    
    // **************************************************
    //  function to dismiss the datapicker
    // **************************************************
    func endEditing() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
                .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(true)
    }
    
    // **************************************************
    //  load data including both imagre and info
    // **************************************************
    func loadData() {
        loadImageFromFirebase()
        //loadSampleDataFromGoogleCloud()
    }
    
    
    // **************************************************
    //  load image from the firebase storage
    // **************************************************
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference(withPath: FILE_NAME)
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("Download success")
            self.imageURL = "\(url!)"
        }
    }
}

struct AccountProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AccountProfileView()
    }
}
