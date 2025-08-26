//
//  CommandsManager.swift
//  NotACalendar
//
//  Created by jocke on 26/08/2025.
//

import Foundation
import SwiftUI

class CommandManager: ObservableObject {
  @Published var commands: [any Command]

  init() {
    self.commands = [
      HelloWorldCommand()
    ]
    
    for cmd in commands {
        if ShortcutManager.shared.shortcut(for: cmd) == nil,
           let defaultShortcut = cmd.defaultShortcut
        {
            ShortcutManager.shared.updateShortcut(defaultShortcut, for: cmd)
        }
    }
  }

  func execute(_ cmd: any Command) {
    cmd.execute()
  }
}
