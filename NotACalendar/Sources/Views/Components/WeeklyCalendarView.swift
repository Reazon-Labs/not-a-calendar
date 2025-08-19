//
//  WeeklyCalendarView.swift
//  NotACalendar
//
//  Created by jocke on 18/08/2025.
//
import SwiftUI

struct WeeklyCalendarView: View {
    let weekStart: Date
    let calendar = Calendar.current
    let hours = Array(0..<24)
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(hours, id: \.self) { hour in
                    HStack(spacing: 0) {
                        // Hour label
                        Text("\(hour):00")
                            .font(.caption)
                            .frame(width: 40, alignment: .trailing)
                            .padding(.trailing, 4)
                        
                        // 7 day slots
                        ForEach(0..<7, id: \.self) { _ in
                            Rectangle()
                                .strokeBorder(Color.gray.opacity(0.2), lineWidth: 0.5)
                                .frame(height: 60) // 1 hour = 60px
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
    }
}
