import SwiftUI

struct TaskPlacementView: View {
  let event: TaskModel
  let weekStart: Date
  let hourHeight: CGFloat
  let columnWidth: CGFloat

  var body: some View {
    let layout = TaskLayout(
      event: event,
      weekStart: weekStart,
      hourHeight: hourHeight,
      columnWidth: columnWidth
    )

    TaskView(event: event)
      .frame(width: layout.width - 4, height: layout.height)
      .offset(x: layout.x + 2, y: layout.y)
  }
}
