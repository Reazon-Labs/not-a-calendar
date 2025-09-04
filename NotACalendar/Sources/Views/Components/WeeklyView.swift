//
//  WeeklyView.swift
//  NotACalendar
//
//  Created by jocke on 04/09/2025.
//

import SwiftUI

struct WeeklyView: View {
  let weekStart: Date
  let events: [TaskModel]

  var body: some View {
    VStack(spacing: 0) {
      WeekdayHeader(weekStart: weekStart)
      Divider()
      WeekGrid(weekStart: weekStart, events: events)
    }
  }
}

#Preview {
  let weekStart = Calendar.current.date(
    from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!

  let events: [TaskModel] = [
    TaskModel(
      title: "Test",
      deadline: DateInterval(
        start: Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!,
        end: Calendar.current.date(bySettingHour: 1, minute: 0, second: 0, of: Date())!)),
    TaskModel(
      title: "Meeting",
      deadline: DateInterval(
        start: Calendar.current.date(
          bySettingHour: 9, minute: 0, second: 0, of: Date())!,
        end: Calendar.current.date(
          bySettingHour: 10, minute: 30, second: 0, of: Date())!)),
    TaskModel(
      title: "Workout",
      deadline: DateInterval(
        start: Calendar.current.date(
          bySettingHour: 11, minute: 0, second: 0, of: Date())!,
        end: Calendar.current.date(
          bySettingHour: 12, minute: 0, second: 0, of: Date())!)),
  ]

  WeeklyView(
    weekStart: weekStart, events: events)

}
