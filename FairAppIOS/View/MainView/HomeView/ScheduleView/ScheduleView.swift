//
//  ScheduleView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/7/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct ScheduleView: View {
    
    //@ObservedObject var schedule_setting: Schedule_Setting = .shared
    @EnvironmentObject var schedule_setting: Schedule_Setting
    

    
    @State var scheduleState = 0 {
        didSet {
            self.schedule_setting.scheduleState = scheduleState
        }
    }
//    @State var switchState = true
//    @State var wakeUpS = Date()
//    @State var wakeUpE = Date()
    
    @State var showDatePicker = false
    @State var datePickerDate: Date = Date()
    
    //@State var notificationToggle = false
    
    @ObservedObject var schedule_list_template = Schedule_List()
    @ObservedObject var schedule_list_current = Schedule_List()
    @ObservedObject var schedule_list_next = Schedule_List()
    
    
    
    
    
    var body: some View {
        
        VStack {
            
            Picker(selection: self.$scheduleState, label: Text("Schedule State")) {
                Text("Template").tag(0)
                Text("Current Week").tag(1)
                Text("Next Week").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            GeometryReader { geometry in
            
                    // template
                    if (self.scheduleState == 0) {
                        //VStack(alignment: .center) {
                            Form {
                                ForEach(self.schedule_list_template.schedules) { item in
                                    Schedule_Row(schedule: self.$schedule_list_template.schedules[self.schedule_list_template.schedules.firstIndex(of: item)!])
                                }
                                
                                
                                Button(action: {
                                    
                                })
                                {
                                    Text("Save")
                                    .multilineTextAlignment(.center)
                                    .padding(2)
                                    
                                }
                                
                                Button(action: {
                                    
                                })
                                {
                                    Text("Reset")
                                        .multilineTextAlignment(.center)
                                    .padding(2)
                                }
                                
                                
                            }   // Form
                            .padding(.bottom, 0)

                        //}.padding(2)

                        
                        
                    }
                        
                        // Current week
                    else if (self.scheduleState == 1) {
                        
                        Form {
                            ForEach(self.schedule_list_current.schedules) { item in
                                Schedule_Row(schedule: self.$schedule_list_current.schedules[self.schedule_list_current.schedules.firstIndex(of: item)!])
                            }
                            
                            
                            Button(action: {
                                
                            })
                            {
                                Text("Save")
                                .multilineTextAlignment(.center)
                                .padding(2)
                                
                            }
                            
                            Button(action: {
                                
                            })
                            {
                                Text("Apply Template")
                                    .multilineTextAlignment(.center)
                                .padding(2)
                            }
                            
                            
                        }   // Form
                        .padding(.bottom, 0)
                        
                    }
                        // Next week
                    else if (self.scheduleState == 2) {
                        Form {
                            ForEach(self.schedule_list_next.schedules) { item in
                                Schedule_Row(schedule: self.$schedule_list_next.schedules[self.schedule_list_next.schedules.firstIndex(of: item)!])
                            }
                            
                            
                            Button(action: {
                                
                            })
                            {
                                Text("Save")
                                .multilineTextAlignment(.center)
                                .padding(2)
                                
                            }
                            
                            Button(action: {
                                
                            })
                            {
                                Text("Apply Template")
                                    .multilineTextAlignment(.center)
                                .padding(2)
                            }
                            
                            
                        }   // Form
                        .padding(.bottom, 0)
                    }
                

            }.edgesIgnoringSafeArea(.all)
        }
            .navigationBarTitle(Text("Schedule").font(.subheadline), displayMode: .inline)
    .padding(2)
    }
    
}


struct Schedule_Row: View {
    @Binding var schedule: Schedule_Element
    @State private var showDatePicker: Bool = false
    //@Binding var showDatePicker: Bool
    //@State private var showingBottomSheet: Bool = false
    //@State private var showingEndSheet: Bool = false
    
    @EnvironmentObject var schedule_setting: Schedule_Setting
    
    var body: some View {
        Section(header: Text("\(self.schedule.day)")) {
            DatePicker("Openning", selection: self.$schedule.startTime, displayedComponents: .hourAndMinute)
            //Spacer()
            DatePicker("Closing", selection: self.$schedule.endTime, displayedComponents: .hourAndMinute)
            
            Toggle(isOn: $schedule.switchState) {
                Text("Enable")

            }
            
            HStack {
                Text("Location: ")
                TextField("location", text: self.$schedule.location)
            }
    }
    }
}



class Schedule_Setting: ObservableObject {
    //init() {}
    //static let shared = Schedule_Setting()
    @Published var scheduleState: Int = 0
    @Published var showDatePicker: Bool = false
    @Published var pickedDate: Date = Date()
    
//    @Published var startTime: Date = Date()
//    @Published var endTime: Date = Date()
    
    @Published var targetDay: String = ""
    @Published var isStartTime: Bool = true
    

}


class Schedule_Element : ObservableObject, Identifiable, Equatable{
    static func == (lhs: Schedule_Element, rhs: Schedule_Element) -> Bool {
        return lhs.id == rhs.id
    }

    @Published var id = UUID()
    @Published var day: String = ""
    @Published var switchState: Bool = true {
        didSet {
            //print("\(day) is \(switchState)")

        }
    }

    @Published var startTime: Date {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            self.startTimeStr = formatter.string(from: startTime)
        }
    }

    var startTimeStr: String = ""

    @Published var endTime: Date {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            self.endTimeStr = formatter.string(from: endTime)
        }
    }
    
    @Published var location: String = ""

    var endTimeStr: String = ""

    init(day: String, switchState: Bool, location: String) {
        self.day = day
        self.switchState = switchState
        self.startTime = Date()
        self.endTime = Date()
        self.location = location

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        self.startTimeStr = formatter.string(from: self.startTime)
        self.endTimeStr = formatter.string(from: self.endTime)
    }


}

class Schedule_List: ObservableObject {
    @Published var schedules = [
        Schedule_Element(day: "Monday", switchState: true, location: "CNY Regional Market Stall 01"),
        Schedule_Element(day: "Tuesday", switchState: true, location: "CNY Regional Market Stall 02"),
        Schedule_Element(day: "Wednesday", switchState: true, location: "CNY Regional Market Stall 03"),
        Schedule_Element(day: "Thursday", switchState: true, location: "CNY Regional Market Stall 04"),
        Schedule_Element(day: "Friday", switchState: true, location: "CNY Regional Market Stall 05"),
        Schedule_Element(day: "Saturday", switchState: true, location: "CNY Regional Market Stall 06"),
        Schedule_Element(day: "Sunday", switchState: true, location: "CNY Regional Market Stall 07")
    ]

}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            //.environmentObject(self.schedule_setting)
    }
}
