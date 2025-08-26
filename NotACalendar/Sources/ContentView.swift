import SwiftUI

public struct ContentView: View {
  let calendar = Calendar.current
  let cmdManager = CommandManager()

  public var body: some View {

    ForEach(cmdManager.commands, id: \.id) { cmd in
      if let shortcut = cmd.currentShortcut {
        Button("") {
          cmdManager.execute(cmd)
        }
        .keyboardShortcut(shortcut)
        .opacity(0)
      }
    }

    let weekStart = calendar.startOfDay(for: Date())  // adjust to Monday if needed
    let sample = [
      TaskModel(
        title: "Test",
        deadline: DateInterval(
          start: calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!,
          end: calendar.date(bySettingHour: 1, minute: 0, second: 0, of: Date())!)),
      TaskModel(
        title: "Meeting",
        deadline: DateInterval(
          start: calendar.date(
            bySettingHour: 9, minute: 0, second: 0, of: Date())!,
          end: calendar.date(
            bySettingHour: 10, minute: 30, second: 0, of: Date())!)),
      TaskModel(
        title: "Workout",
        deadline: DateInterval(
          start: calendar.date(
            bySettingHour: 11, minute: 0, second: 0, of: Date())!,
          end: calendar.date(
            bySettingHour: 12, minute: 0, second: 0, of: Date())!)),
    ]

    VStack {
      WeekdayHeader(weekStart: weekStart)
      Divider()
      WeekGrid(weekStart: weekStart, events: sample)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
