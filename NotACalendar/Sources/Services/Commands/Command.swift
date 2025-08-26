//
//  Command.swift
//  NotACalendar
//
//  Created by jocke on 26/08/2025.
//

import Foundation
import SwiftUI

protocol Command: Identifiable {
  var id: UUID { get }
  var title: String { get }
  var description: String { get }
  var defaultShortcut: KeyboardShortcut? { get }

  func execute()
}

extension Command {
  var currentShortcut: KeyboardShortcut? {
    get { ShortcutManager.shared.shortcut(for: self) }
    set { ShortcutManager.shared.updateShortcut(newValue, for: self) }
  }
}
