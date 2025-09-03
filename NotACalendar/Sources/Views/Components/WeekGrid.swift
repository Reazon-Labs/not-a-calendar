import SwiftUI

// MARK: - Week Grid View

struct WeekGrid: View {
  let weekStart: Date
  let events: [TaskModel]

  @State private var hourHeight: CGFloat = 60.0

  private let hourColumnWidth: CGFloat = 44
  private let numDays = 7

  var body: some View {
    ScrollView {
      HStack(alignment: .top, spacing: 0) {
        HourColumnView(hourHeight: hourHeight)

        GeometryReader { geo in
          let columnWidth = geo.size.width / CGFloat(numDays)

          ZStack(alignment: .topLeading) {
            GridLinesView(hourHeight: hourHeight)

            eventContainer(columnWidth: columnWidth)
          }
        }
      }
      .frame(height: 24 * hourHeight)
    }
  }

  private func eventContainer(columnWidth: CGFloat) -> some View {
    ForEach(events) { event in
      EventPlacementView(
        event: event,
        weekStart: weekStart,
        hourHeight: hourHeight,
        columnWidth: columnWidth
      )
    }
  }
}

// MARK: - Preview

#Preview {
  struct PreviewWrapper: View {
    let weekStart = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!

    // Mock data for preview
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
            bySettingHour: 12, minute: 0, second: 0, of: Date())!)),    ]

    var body: some View {
      WeekGrid(weekStart: weekStart, events: events)
    }
  }
  
  return PreviewWrapper()
}
