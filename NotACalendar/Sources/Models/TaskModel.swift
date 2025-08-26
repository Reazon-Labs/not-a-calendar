//
//  TaskModel.swift
//  NotACalendar
//
//  Created by jocke on 20/08/2025.
//

import Foundation

struct TaskModel: Identifiable {
  // Basic data
  let id: UUID = UUID()
  var title: String
  var body: String?
  var createdAt = Date()
  var updatedAt = Date()

  // Event data
  var allDay: Bool = false
  var isCompleted: Bool = false
  var deadline: DateInterval
  var doDates: [DateInterval]?

  // Smart scheduling data
  var estimatedTime: TimeInterval = 30 * 60  // 30 minutes
  var priority: TaskPriority = .none
  var effortLevel: EffortLevel = .low
  var dependencies: [UUID]?
  var isPinned: Bool = false
}

enum TaskPriority {
  case none
  case low
  case medium
  case high
}

enum EffortLevel {
  case low
  case medium
  case high
}
