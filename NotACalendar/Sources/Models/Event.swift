//
//  Event.swift
//  NotACalendar
//
//  Created by jocke on 18/08/2025.
//
import Foundation


struct Event: Identifiable {
    let id = UUID()
    let title: String
    let start: Date
    let end: Date
}
