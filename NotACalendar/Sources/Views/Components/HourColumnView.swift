import SwiftUI

// MARK: - Hour Column View

struct HourColumnView: View {
  let hourHeight: CGFloat

  var body: some View {
    ZStack(alignment: .topTrailing) {
      // Hour labels from 1:00 to 23:00
      ForEach(1..<24, id: \.self) { hour in
        Text("\(hour):00")
          .font(.caption2)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .padding(.trailing, 4)
          .offset(y: hourHeight * CGFloat(hour) - 7)  // -7 to center vertically on the line
      }
    }
    .frame(width: 44)
  }
}
