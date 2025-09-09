import SwiftUI

// MARK: - Grid Lines View

struct GridLinesView: View {
  let hourHeight: CGFloat
  @ObservedObject var viewModel: WeeklyViewModel

  var body: some View {
    ZStack(alignment: .top) {
      // Horizontal lines
      VStack(spacing: 0) {
        ForEach(0..<24, id: \.self) { i in
          if i != 0 {
            Divider()
          }
          Spacer().frame(height: hourHeight - 1)
        }
        Divider()
      }

      // Vertical lines
      HStack(spacing: 0) {
        ForEach(0..<viewModel.daysDisplayed, id: \.self) { i in
          if i > 0 {
            Divider()
          }
          Spacer()
        }
      }
    }
  }
}
