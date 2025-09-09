import SwiftUI

// MARK: - Grid Lines View

struct GridLinesView: View {
  let hourHeight: CGFloat
  let numDays: Int = 7

  var body: some View {
    ZStack(alignment: .top) {
      // Horizontal lines
      VStack(spacing: 0) {
        ForEach(0..<24, id: \.self) { _ in
          Divider()
          Spacer().frame(height: hourHeight - 1)
        }
        Divider()
      }

      // Vertical lines
      HStack(spacing: 0) {
        ForEach(0..<numDays, id: \.self) { i in
          if i > 0 {
            Divider()
          }
          Spacer()
        }
      }
    }
  }
}
