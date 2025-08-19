import SwiftUI

public struct ContentView: View {
    let calendar = Calendar.current

    public var body: some View {

        let weekStart = calendar.startOfDay(for: Date())  // adjust to Monday if needed
        let sampleEvents = [
            Event(
                title: "Test",
                start: calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!,
                end: calendar.date(bySettingHour: 1, minute: 0, second: 0, of: Date())!
            ),
            Event(
                title: "Meeting",
                start: calendar.date(
                    bySettingHour: 9, minute: 0, second: 0, of: Date())!,
                end: calendar.date(
                    bySettingHour: 10, minute: 30, second: 0, of: Date())!),
            Event(
                title: "Workout",
                start: calendar.date(
                    bySettingHour: 11, minute: 0, second: 0, of: Date())!,
                end: calendar.date(
                    bySettingHour: 12, minute: 0, second: 0, of: Date())!),
        ]

        VStack {
            WeekdayHeader(weekStart: weekStart)
            Divider()
            WeekGrid(weekStart: weekStart, events: sampleEvents)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
