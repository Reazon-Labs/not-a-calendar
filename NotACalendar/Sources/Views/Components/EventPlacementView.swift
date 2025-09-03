import SwiftUI

// MARK: - Event Placement View

struct EventPlacementView: View {
  let event: TaskModel
  let weekStart: Date
  let hourHeight: CGFloat
  let columnWidth: CGFloat

  var body: some View {
    let layout = EventLayout(
      event: event,
      weekStart: weekStart,
      hourHeight: hourHeight,
      columnWidth: columnWidth
    )

    // The actual EventView should be defined elsewhere.
    // This is a placeholder for layout purposes.
    EventView(event: event)
      .frame(width: layout.width - 4, height: layout.height)
      .offset(x: layout.x + 2, y: layout.y)
  }
}
