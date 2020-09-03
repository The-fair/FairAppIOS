//
//  ScheduleWeekday.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 7/12/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct ScheduleWeekday: Identifiable {
    var id = UUID()
    var weekday: String
    var startTime: Date
    var endTime: Date
    var location: String
    
}
