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
                        VStack(alignment: .center) {
                            List {
                                ForEach(self.schedule_list_template.schedules) { item in
                                    Schedule_Row(schedule: self.$schedule_list_template.schedules[self.schedule_list_template.schedules.firstIndex(of: item)!],
                                                 showDatePicker: self.$showDatePicker)
                                }
//                                ForEach(self.schedule_setting.schedule_list_template) { item in
//                                    Schedule_Row(schedule: self.$schedule_setting.schedule_list_template[self..schedule_setting.schedule_list_template.firstIndex(of: item)!],
//                                        showDatePicker: self.$showDatePicker)
//                                    .environmentObject(self.schedule_setting)
//                                }
                            }   // List
                                .padding(.bottom, 0)
                                .frame(height: 400)
                                .environment(\.defaultMinListRowHeight, 50)

                            .listStyle(GroupedListStyle())
                            
                            //Spacer(minLength: 5)
                            
                            List {
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
                            }
                            .listStyle(GroupedListStyle())
                        //.padding(10)
                            


                        }.padding(2)

                        
                        
                    }
                        
                        // Current week
                    else if (self.scheduleState == 1) {
                        
                        List {
                            ForEach(self.schedule_list_current.schedules) { item in
                                Schedule_Row(schedule: self.$schedule_list_current.schedules[self.schedule_list_current.schedules.firstIndex(of: item)!],
                                             showDatePicker: self.$showDatePicker)
                            }
//                            ForEach(self.schedule_setting.schedule_list_current) { item in
//                                Schedule_Row(schedule: self.$schedule_setting.schedule_list_template[self..schedule_setting.schedule_list_template.firstIndex(of: item)!],
//                                    showDatePicker: self.$showDatePicker)
//                                .environmentObject(self.schedule_setting)
//                            }
                        }   // List
                        .padding()
                        
                    }
                        // Next week
                    else if (self.scheduleState == 2) {
                        List {
                            ForEach(self.schedule_list_next.schedules) { item in
                                Schedule_Row(schedule: self.$schedule_list_next.schedules[self.schedule_list_next.schedules.firstIndex(of: item)!],
                                             showDatePicker: self.$showDatePicker)
                            }
//                            ForEach(self.schedule_setting.schedule_list_next) { item in
//                                Schedule_Row(schedule: self.$schedule_setting.schedule_list_template[self..schedule_setting.schedule_list_template.firstIndex(of: item)!],
//                                    showDatePicker: self.$showDatePicker)
//                                .environmentObject(self.schedule_setting)
//                            }
                        }   // List
                        .padding()
                    }
                
                BottomSheetView(
                    isOpen: self.$showDatePicker,
                    maxHeight: geometry.size.height * 0.5
                ) {
                    Schedule_DatePickerView(date: self.$datePickerDate).environmentObject(self.schedule_setting)
                }

                

            }.edgesIgnoringSafeArea(.all)
        }
    .padding(5)
    }
    
}


struct Schedule_Row: View {
    @Binding var schedule: Schedule_Element
    @Binding var showDatePicker: Bool
    //@State private var showingBottomSheet: Bool = false
    //@State private var showingEndSheet: Bool = false
    
    @EnvironmentObject var schedule_setting: Schedule_Setting
    
    var body: some View {
        VStack {
            HStack(alignment:.center) {
//                GeometryReader { geometry in
//
//                }
                VStack {
                    Text(schedule.day)
                    
                    HStack(alignment:.center) {
                        HStack {
                            Button(action: {
                                self.showDatePicker.toggle()
                                self.schedule_setting.targetDay = self.schedule.day
                                print(self.schedule_setting.targetDay)
                            })
                            {
                                Text(schedule.startTimeStr)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        
                        Text(" to ")
                        
                        HStack {
                            Button(action: {
                                self.showDatePicker.toggle()
                                self.schedule_setting.targetDay = self.schedule.day
                                print(self.schedule_setting.targetDay)
                            })
                            {
                                Text(schedule.endTimeStr)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        
                        
                    }
                    .frame(height: nil)
                        .frame(width: nil)   // HStack
                        //.frame(maxWidth: .infinity)
                }
                
                Spacer()
                
                Toggle(isOn: $schedule.switchState) {
                    Text("Switch")
                }
                .labelsHidden()
                
            }   // HStack
            .frame(height: nil)
            .frame(width: nil)   // HStack
            .frame(maxWidth: .infinity)
            
            

            
            
        }   // VStack
        .padding(0)
        .frame(height: 50)
        
    }
}

struct Schedule_DatePickerView: View {
    @Binding var date : Date {
        didSet {
            //schedule_setting.pickedDate = date
        }
    }
    
    @EnvironmentObject var schedule_setting: Schedule_Setting
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                    //self.switchState = false
                    self.schedule_setting.pickedDate = self.date
                }) {
                    Text("Done")
                }
                .offset(x: 120, y: -80)
                
                DatePicker("Start", selection:  $date, displayedComponents:  .hourAndMinute)
                    .labelsHidden()
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
    @Published var targetDay: String = ""
    @Published var isStartTime: Bool = true
    
//    @Published var schedule_list_template = [
//        Schedule_Element(day: "Monday", switchState: true),
//        Schedule_Element(day: "Tuesday", switchState: true),
//        Schedule_Element(day: "Wednesday", switchState: true),
//        Schedule_Element(day: "Thursday", switchState: true),
//        Schedule_Element(day: "Friday", switchState: true),
//        Schedule_Element(day: "Saturday", switchState: true),
//        Schedule_Element(day: "Sunday", switchState: true)
//    ]
//
//    @Published var schedule_list_current = [
//        Schedule_Element(day: "Monday", switchState: true),
//        Schedule_Element(day: "Tuesday", switchState: true),
//        Schedule_Element(day: "Wednesday", switchState: true),
//        Schedule_Element(day: "Thursday", switchState: true),
//        Schedule_Element(day: "Friday", switchState: true),
//        Schedule_Element(day: "Saturday", switchState: true),
//        Schedule_Element(day: "Sunday", switchState: true)
//    ]
//
//    @Published var schedule_list_template = [
//        Schedule_Element(day: "Monday", switchState: true),
//        Schedule_Element(day: "Tuesday", switchState: true),
//        Schedule_Element(day: "Wednesday", switchState: true),
//        Schedule_Element(day: "Thursday", switchState: true),
//        Schedule_Element(day: "Friday", switchState: true),
//        Schedule_Element(day: "Saturday", switchState: true),
//        Schedule_Element(day: "Sunday", switchState: true)
//    ]
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
    
    var endTimeStr: String = ""
    
    init(day: String, switchState: Bool) {
        self.day = day
        self.switchState = switchState
        self.startTime = Date()
        self.endTime = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        self.startTimeStr = formatter.string(from: self.startTime)
        self.endTimeStr = formatter.string(from: self.endTime)
    }
    
    
}

class Schedule_List: ObservableObject {
    @Published var schedules = [
        Schedule_Element(day: "Monday", switchState: true),
        Schedule_Element(day: "Tuesday", switchState: true),
        Schedule_Element(day: "Wednesday", switchState: true),
        Schedule_Element(day: "Thursday", switchState: true),
        Schedule_Element(day: "Friday", switchState: true),
        Schedule_Element(day: "Saturday", switchState: true),
        Schedule_Element(day: "Sunday", switchState: true)
    ]

}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            //.environmentObject(self.schedule_setting)
    }
}
