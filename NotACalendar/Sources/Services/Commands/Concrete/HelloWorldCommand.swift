//
//  HelloWorldCommand.swift
//  NotACalendar
//
//  Created by jocke on 26/08/2025.
//

import Foundation
import SwiftUI

struct HelloWorldCommand: Command {
  var id: UUID = UUID()
  var title: String = "Hello World"
  var description: String = "Displays 'Hello World' in the console. Testing purposes only"
  var defaultShortcut:  KeyboardShortcut? = KeyboardShortcut("h", modifiers: [.command, .option])

  func execute() {
    print("Hello World from the command system !")
  }
}
