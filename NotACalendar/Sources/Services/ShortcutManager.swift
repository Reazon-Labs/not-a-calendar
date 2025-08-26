//
//  ShortcutManager.swift
//  NotACalendar
//
//  Created by jocke on 26/08/2025.
//

import Foundation
import SwiftUI

class ShortcutManager: ObservableObject {
  static let shared = ShortcutManager()

  @Published private(set) var shortcuts: [UUID: KeyboardShortcut] = [:]

  private init() {
    loadShortcuts()
    print(shortcuts)
  }

  func shortcut(for command: any Command) -> KeyboardShortcut? {
    shortcuts[command.id]
  }

  func updateShortcut(_ shortcut: KeyboardShortcut?, for command: any Command) {
    shortcuts[command.id] = shortcut
    saveShortcuts()
  }

  private func loadShortcuts() {
    if let data = UserDefaults.standard.data(forKey: "shortcuts"),
      let decoded = try? JSONDecoder().decode([UUID: ShortcutData].self, from: data)
    {
      self.shortcuts = decoded.mapValues { $0.keyboardShortcut }
    }
  }

  private func saveShortcuts() {
    let encoded = shortcuts.mapValues { ShortcutData(shortcut: $0) }
    if let data = try? JSONEncoder().encode(encoded) {
      UserDefaults.standard.set(data, forKey: "shortcuts")
    }
  }
}

private struct ShortcutData: Codable {
  let key: String
  let modifiers: Int

  init(shortcut: KeyboardShortcut) {
    self.key = String(shortcut.key.character)
    self.modifiers = shortcut.modifiers.rawValue
  }

  var keyboardShortcut: KeyboardShortcut {
    KeyboardShortcut(KeyEquivalent(key.first!), modifiers: EventModifiers(rawValue: modifiers))
  }
}
