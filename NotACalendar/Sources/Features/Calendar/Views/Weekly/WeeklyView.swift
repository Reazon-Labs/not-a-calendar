//
//  WeeklyView.swift
//  NotACalendar
//
//  Created by jocke on 04/09/2025.
//

import SwiftUI

struct WeeklyView: View {
  @ObservedObject private var viewModel = WeeklyViewModel()

  init() {
    viewModel.fetchTasks(since: Date(), days: 7)
  }

  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 4) {
        Text(viewModel.month)
          .font(.headline)

        Spacer()

        Button {
          viewModel.resetOffset()
        } label: {
          Text("Today")
        }

        Button {
          viewModel.previousWeek()
        } label: {
          Image(systemName: "chevron.left")
        }

        Button {
          viewModel.nextWeek()
        } label: {
          Image(systemName: "chevron.right")
        }
      }
      .padding(.horizontal, 6)

      WeekdayHeaderView(viewModel: viewModel, weekStart: viewModel.currentWeekStart)
      Divider()
      WeekGridView(viewModel: viewModel)
    }
    .padding(.top, 4)
  }

}

#Preview {
  WeeklyView()
}
