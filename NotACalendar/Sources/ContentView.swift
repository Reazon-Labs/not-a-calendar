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
        .hidden()
      }
    }

    WeeklyView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
