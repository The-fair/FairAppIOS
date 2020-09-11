//
//  ContentView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import SwiftUI


// this is the entrance of the app view
struct MainView: View {
    
    @EnvironmentObject var session: AuthSessionStore
    
    //@Environment(\.managedObjectContext) var moc
    
    //@FetchRequest(entity: Schedule_Current_Entity.entity(), sortDescriptors: []) var schedules: FetchedResults<Schedule_Current_Entity>
    
    
    
    // **************************************************
    //  the function to get session user status
    // **************************************************
    func getUser() {
        generatePremadeData {
            //print("test sequence")
            self.session.listen()
        }
        //session.listen()
    }
    
    func generatePremadeData(cbfunc: @escaping() -> Void) {
        //print("Generating Premade Data")
        cbfunc()
    }
    
    func generateScheduleData(cbfunc: @escaping() -> Void) {
        
        let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        let startTime = Date()
        let endTime = Date()

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        let startTimeStr = formatter.string(from: startTime)
        let endTimeStr = formatter.string(from: endTime)
        
        //var startTimes: [String] = []
        //var endTimes: [String] = []
        
//        for index in 0...6 {
//            //startTimes.append(startTimeStr)
//            //endTimes.append(endTimeStr)
//            let schedule = Schedule_Current_Entity(context: self.moc)
//            schedule.id = UUID()
//            schedule.weekday = weekdays[index]
//            schedule.startDate = startTimeStr
//            schedule.endDate = endTimeStr
//        }
        
        
        
        cbfunc()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Home")
                        }

                    StoreView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Store")
                        }
                    
                    AccountInfoView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Profile")
                        }
                }
                
                /*
                Text("Welcome back user")
                Button(action: session.signOut) {
                    Text("SignOut")
                }
                */
            }
            else {
                //Text("Show auth screen")
                //AuthView()
                PreLoginView()
            }
        }.onAppear(perform: getUser)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        //MainView().environmentObject(AuthSessionStore())
        PreLoginView()
    }
}
