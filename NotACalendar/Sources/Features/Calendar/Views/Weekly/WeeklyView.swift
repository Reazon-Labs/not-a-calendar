//
//  WeeklyView.swift
//  NotACalendar
//
//  Created by jocke on 04/09/2025.
//

import SwiftUI

struct WeeklyView: View {
  @ObservedObject private var viewModel = WeeklyViewModel()

  init() {
    viewModel.fetchTasks(since: Date(), days: 7)
  }
  
  var body: some View {
    if viewModel.tasks == nil {
      Text("Loading")
    } else {

      VStack(spacing: 0) {
        HStack(spacing: 0) {
          Button {
            viewModel.resetOffset()
          } label: {
            Text("Today")
          }
          
          Spacer().frame(width: 4)
          
          Button {
            viewModel.previousWeek()
          } label: {
            Image(systemName: "chevron.left")
          }
          
          Button {
            viewModel.nextWeek()
          } label: {
            Image(systemName: "chevron.right")
          }
        }
        
        WeekdayHeader(viewModel: viewModel, weekStart: viewModel.currentWeekStart)
        Divider()
        WeekGrid(weekStart: viewModel.currentWeekStart, events: viewModel.tasks!)
      }
      .padding(.top, 4)
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

  WeeklyView()

}
