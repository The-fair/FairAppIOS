//
//  StoreScheduleView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 9/9/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

struct StoreScheduleView: View {
    
//    @Environment(\.managedObjectContext) var moc
//
//    @FetchRequest(entity: Schedule_Current_Entity.entity(), sortDescriptors: []) var schedules: FetchedResults<Schedule_Current_Entity>
    
    @ObservedObject var schedule_list_current = Schedule_List()
    
    
    func getDate() -> String {
        
        
        // extract month in string
        let monthInt = Calendar.current.component(.month, from: Date())
        let monthStr = Calendar.current.monthSymbols[monthInt - 1]
        
        // extract day in integer
        let dayInt = Calendar.current.component(.day, from: Date())
        
        // extract week in string
        let weekInt = Calendar.current.component(.weekday, from: Date())
        let weekStr = Calendar.current.weekdaySymbols[weekInt - 1]
        
        return monthStr + ". " + String(dayInt) + "     " + weekStr
        
    }
    

    

    
    var body: some View {
        Section(header: Text("Openning Hours")){
            //let str = self.getDate() + self.getScheduleStartByWeekday(weekday: schedule_list_current.schedules[0].day)
            Text("     \(getDate() + schedule_list_current.schedules[0].startTimeStr + " - " + schedule_list_current.schedules[0].endTimeStr)")
//            List{
//                ForEach(schedules, id: \.id) { schedule in
//                    //Text(schedule.weekday ?? "Unknown")
//                    Text((schedule.startDate ?? "Unknown") + (schedule.endDate ?? "Unknown"))
//
//                }
//            }
        }
        
    }
}
