import SwiftUI

struct WeekGrid: View {
  @State private var hourHeight: CGFloat = 60.0
  @ObservedObject var viewModel: WeeklyViewModel

  private let hourColumnWidth: CGFloat = 44

  var body: some View {
    ScrollView {
      HStack(alignment: .top, spacing: 0) {
        HourColumnView(hourHeight: hourHeight)

        GeometryReader { geo in
          let columnWidth = geo.size.width / CGFloat(viewModel.daysDisplayed)

          ZStack(alignment: .topLeading) {
            GridLinesView(hourHeight: hourHeight, viewModel: viewModel)

            eventContainer(columnWidth: columnWidth)
          }
        }
      }
      .frame(height: 24 * hourHeight)
    }
  }

  private func eventContainer(columnWidth: CGFloat) -> some View {
    ForEach(viewModel.tasks!) { task in
      TaskPlacementView(
        event: task,
        weekStart: viewModel.currentWeekStart,
        hourHeight: hourHeight,
        columnWidth: columnWidth
      )
    }
  }
}
