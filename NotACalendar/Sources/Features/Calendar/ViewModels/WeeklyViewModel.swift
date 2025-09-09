//
//  WeeklyViewModel.swift
//  NotACalendar
//
//  Created by jocke on 09/09/2025.
//

import Foundation

class WeeklyViewModel: ObservableObject {
  private let calendar: Calendar = .current

  @Published var daysDisplayed: Int
  @Published var currentWeekStart: Date
  @Published private(set) var tasks: [TaskModel]?

  init(startDate: Date = Date(), daysDisplayed: Int = 7) {
    self.daysDisplayed = daysDisplayed
    self.currentWeekStart = calendar.startOfWeek(for: startDate)
  }
  
  var month: String {
    currentWeekStart.formatted(.dateTime.month(.wide).year())
  }

  func loadWeek(for date: Date) {
    self.currentWeekStart = calendar.startOfWeek(for: date)
  }
  
  func nextWeek() {
    if let next = calendar.date(byAdding: .day, value: 7, to: currentWeekStart) {
      currentWeekStart = next
    }
  }
  
  func previousWeek() {
    if let previous = calendar.date(byAdding: .day, value: -7, to: currentWeekStart) {
      currentWeekStart = previous
    }
  }
  
  func isToday(_ date: Date) -> Bool {
    calendar.isDateInToday(date)
  }
  
  func resetOffset() {
    currentWeekStart = calendar.startOfWeek(for: Date())
  }


  func fetchTasks(since day: Date, days: Int) {
    let day = calendar.startOfDay(for: day)
    
    tasks = [
      TaskModel(
        title: "Test",
        deadline: DateInterval(
          start: day.addingTimeInterval(60 * 60),
          end: day.addingTimeInterval(3 * 60 * 60)))
    ]
  }
}
