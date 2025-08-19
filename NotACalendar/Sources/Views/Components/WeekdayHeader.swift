//
//  WeekdayHeader.swift
//  NotACalendar
//
//  Created by jocke on 18/08/2025.
//
import SwiftUI


struct WeekdayHeader: View {
    let weekStart: Date
    let calendar = Calendar.current
    
    var body: some View {
        HStack {
            Spacer().frame(width: 44) // to align with hour labels
            
            ForEach(0..<7, id: \.self) { offset in
                let day = calendar.date(byAdding: .day, value: offset, to: weekStart)!
                VStack {
                    Text(day, format: .dateTime.weekday(.abbreviated)) // Mon, Tue
                    Text(day, format: .dateTime.day()) // 12, 13
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 8)
    }
}
