//
//  WeekGrid.swift
//  NotACalendar
//
//  Created by jocke on 18/08/2025.
//
import SwiftUI

struct WeekGrid: View {
  let weekStart: Date
  let events: [TaskModel]
  let calendar = Calendar.current

  var body: some View {
    ScrollView {
      GeometryReader { geo in
        let columnWidth = (geo.size.width - 44) / 7  // subtract hour label

        ZStack(alignment: .topLeading) {
          eventGrid

          // Events overlay
          ForEach(events, id: \.id) { event in
            EventVview(event: event, weekStart: weekStart, columnWidth: columnWidth)
          }
        }
      }
      .frame(height: 24 * 60)  // 24h * 60px per hour
    }
  }

  var eventGrid: some View {
    LazyVStack(spacing: 0) {
      ForEach(0..<24, id: \.self) { hour in
        HStack(alignment: .top, spacing: 0) {
          Text(hour != 0 ? "\(hour):00" : "")
            .font(.caption2)
            .frame(width: 40, alignment: .trailing)
            .padding(.trailing, 4)

          ForEach(0..<7, id: \.self) { _ in
            Rectangle()
              .strokeBorder(
                Color.gray.opacity(0.2),
                lineWidth: 0.5
              )
              .frame(height: 60, alignment: .top)  // 1h = 60px
              .frame(maxWidth: .infinity)
          }
        }
      }
    }
  }
}

struct EventVview: View {
  let event: TaskModel
  let calendar = Calendar.current
  let weekStart: Date
  let columnWidth: CGFloat

  var body: some View {
    let dayOffset = calendar.dateComponents(
      [.day], from: weekStart, to: event.deadline.start
    ).day!
    let startMinutes =
      calendar.component(.hour, from: event.deadline.start)
      * 60
      + calendar.component(.minute, from: event.deadline.start)
    let endMinutes =
      calendar.component(.hour, from: event.deadline.end) * 60
      + calendar.component(.minute, from: event.deadline.end)
    let duration = endMinutes - startMinutes

    EventView(event: event)
      .frame(
        width: columnWidth - 4,  // leave padding
        height: CGFloat(duration),
        alignment: .topLeading
      )  // 1 min = 1 px
      .offset(
        x: 44 + columnWidth * CGFloat(dayOffset) + 2,
        y: CGFloat(startMinutes)
      )
  }
}
