//
//  EventView.swift
//  NotACalendar
//
//  Created by jocke on 18/08/2025.
//
import SwiftUI

struct EventView: View {
  let event: TaskModel

  var body: some View {
    VStack(alignment: .leading, spacing: 2) {
      Text(event.title)
        .font(.subheadline)

      HStack(spacing: 3) {
        Image(systemName: "clock")
        let start = event.deadline.start.formatted(
          Date.FormatStyle().hour().minute()
        )
        let end = event.deadline.end.formatted(
          Date.FormatStyle().hour().minute()
        )
        Text("\(start)-\(end)")
      }
      .font(.footnote)
      .opacity(0.8)
    }
    .padding(4)
    .frame(
      maxWidth: .infinity,
      maxHeight: .infinity,
      alignment: .topLeading
    )
    .background(Color.blue.opacity(0.7))
    .foregroundColor(.white)
    .cornerRadius(6)
  }
}

#Preview("", traits: .sizeThatFitsLayout) {
  EventView(
    event:
      TaskModel(
        title: "Meeting",
        deadline: DateInterval(
          start: Calendar.current.date(
            bySettingHour: 9,
            minute: 0,
            second: 0,
            of: Date()
          )!,
          end: Calendar.current.date(
            bySettingHour: 10,
            minute: 30,
            second: 0,
            of: Date()
          )!
        )
      ),
  )
  .padding(14)
  .frame(width: 150, height: 60)
}
