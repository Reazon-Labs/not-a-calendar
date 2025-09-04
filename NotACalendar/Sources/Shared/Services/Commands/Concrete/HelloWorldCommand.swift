//
//  HelloWorldCommand.swift
//  NotACalendar
//
//  Created by jocke on 26/08/2025.
//

import Foundation
import SwiftUI

struct HelloWorldCommand: Command {
  var id = "hello_world_command"
  var title = "Hello World"
  var description = "Displays 'Hello World' in the console. Testing purposes only"
  var defaultShortcut: KeyboardShortcut? = KeyboardShortcut("h", modifiers: [.command, .option])

  func execute() {
    print("Hello World from the command system !")
  }
}
