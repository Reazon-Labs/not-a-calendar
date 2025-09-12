import SwiftUI

struct WeekGridView: View {
  @State private var hourHeight: CGFloat = 60.0
  @ObservedObject var viewModel: WeeklyViewModel

  private let hourColumnWidth: CGFloat = 44

  var body: some View {
    ScrollView {
      ZStack {

        HStack(alignment: .top, spacing: 0) {
          HourColumnView(hourHeight: hourHeight)

          GeometryReader { geo in
            let columnWidth = geo.size.width / CGFloat(viewModel.daysDisplayed)

            ZStack(alignment: .topLeading) {
              GridLinesView(hourHeight: hourHeight, viewModel: viewModel)

              if let tasks = viewModel.tasks {
                eventContainer(columnWidth: columnWidth, tasks: tasks)
              }

            }
          }
        }
        .frame(height: 24 * hourHeight)

        if viewModel.isCurrentWeek {
          CurrentTimeIndicatorView(hourHeight: hourHeight)
        }

      }
    }
  }

  private func eventContainer(columnWidth: CGFloat, tasks: [TaskModel]) -> some View {
    ForEach(tasks) { task in
      TaskPlacementView(
        event: task,
        weekStart: viewModel.currentWeekStart,
        hourHeight: hourHeight,
        columnWidth: columnWidth
      )
    }
  }
}
