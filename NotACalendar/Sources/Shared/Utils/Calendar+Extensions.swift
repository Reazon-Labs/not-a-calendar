//
//  Calendar+Extensions.swift
//  NotACalendar
//
//  Created by jocke on 09/09/2025.
//

import Foundation

extension Calendar {
  func startOfWeek(for date: Date) -> Date {
    let components = dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)

    return self.date(from: components)!
  }
}
