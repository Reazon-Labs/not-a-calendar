import Foundation
import SwiftUI

/// A utility to calculate the position and size of an event in the week grid.
struct TaskLayout {
  let event: TaskModel
  let weekStart: Date
  let hourHeight: CGFloat
  let columnWidth: CGFloat

  private let calendar = Calendar.current

  /// The day index of the event within the week (0 for Sunday, 1 for Monday, etc.).
  var dayIndex: Int {
    // To handle week boundaries correctly, we should probably use week-based logic.
    // Assuming week starts on `weekStart` and we just want the day difference.
    return calendar.dateComponents(
      [.day], from: calendar.startOfDay(for: weekStart),
      to: calendar.startOfDay(for: event.deadline.start)
    ).day ?? 0
  }

  /// The starting hour of the event as a decimal value (e.g., 9.5 for 9:30 AM).
  var startHour: Double {
    let hour = Double(calendar.component(.hour, from: event.deadline.start))
    let minute = Double(calendar.component(.minute, from: event.deadline.start))
    return hour + minute / 60.0
  }

  /// The duration of the event in hours.
  var durationInHours: Double {
    let durationInSeconds = event.deadline.duration
    return durationInSeconds / 3600.0
  }

  /// The x-coordinate for the event view.
  var x: CGFloat {
    return CGFloat(dayIndex) * columnWidth
  }

  /// The y-coordinate for the event view.
  var y: CGFloat {
    return CGFloat(startHour) * hourHeight
  }

  /// The height of the event view.
  var height: CGFloat {
    return CGFloat(durationInHours) * hourHeight
  }

  /// The width of the event view.
  var width: CGFloat {
    return columnWidth
  }
}
