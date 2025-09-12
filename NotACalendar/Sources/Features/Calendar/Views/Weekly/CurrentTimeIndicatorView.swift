import SwiftUI

struct CurrentTimeIndicatorView: View {
  let hourHeight: CGFloat
  private let calendar = Calendar.current
  @State private var now = Date()

  private var verticalOffset: CGFloat {
    let hour = calendar.component(.hour, from: now)
    let minute = calendar.component(.minute, from: now)
    return (CGFloat(hour) + CGFloat(minute) / 60) * hourHeight
  }

  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 0) {
        Text(now, style: .time)
          .font(.caption)
          .foregroundColor(.white)
          .padding(.horizontal, 4)
          .padding(.vertical, 1)
          .background(.red)
          .cornerRadius(4)
          .frame(width: 40, alignment: .trailing)
          .padding(.trailing, 4)

        Rectangle()
          .frame(height: 1)
          .foregroundColor(.red)
      }
      .offset(y: -8 + verticalOffset) // 8 is text size + padding

      Spacer()
    }
    .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
      print("\(verticalOffset)")
      now = Date()
    }
  }
}
