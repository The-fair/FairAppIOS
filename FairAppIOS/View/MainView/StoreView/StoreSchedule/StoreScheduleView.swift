//
//  StoreScheduleView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 9/9/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct StoreScheduleView: View {
    
    
    func getDate() -> String {
        
//        let day: String = ""
//        let month: String = ""
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM-dd"
//        let dateString = formatter.string(from: Date())
        
        // extract month in string
        let monthInt = Calendar.current.component(.month, from: Date())
        let monthStr = Calendar.current.monthSymbols[monthInt - 1]
        
        // extract day in integer
        let dayInt = Calendar.current.component(.day, from: Date())
        
        // extract week in string
        let weekInt = Calendar.current.component(.weekday, from: Date())
        let weekStr = Calendar.current.weekdaySymbols[weekInt - 1]
        
        return monthStr + ". " + String(dayInt) + "\t" + weekStr
        
    }
    

    
    var body: some View {
        Section{
          Text("\(getDate())")
        }
        
    }
}
