//
//  WeekdayHeaderView.swift
//  NotACalendar
//
//  Created by jocke on 18/08/2025.
//
import SwiftUI

struct WeekdayHeaderView: View {
  @ObservedObject var viewModel: WeeklyViewModel

  let weekStart: Date
  let calendar = Calendar.current

  var body: some View {
    HStack {
      Spacer().frame(width: 44)  // to align with hour labels

      ForEach(0..<viewModel.daysDisplayed, id: \.self) { offset in
        let day = calendar.date(byAdding: .day, value: offset, to: weekStart)!
        let isToday = viewModel.isToday(day)

        VStack {
          Text(day, format: .dateTime.weekday(.abbreviated))
            .bold(isToday)

          ZStack {
            Circle()
              .fill(isToday ? Color.blue.opacity(0.9) : .clear)
              .frame(width: 25, height: 25)

            Text(day, format: .dateTime.day())
              .foregroundStyle(isToday ? .white : .black)
          }
        }
        .frame(maxWidth: .infinity)
      }
    }
    .padding(.vertical, 8)
  }
}
