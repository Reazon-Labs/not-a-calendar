//
//  WeeklyView.swift
//  NotACalendar
//
//  Created by jocke on 04/09/2025.
//

import SwiftUI

struct WeeklyView: View {
  @StateObject private var viewModel = WeeklyViewModel()

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

      WeekdayHeaderView(viewModel: viewModel)
      Divider()
      WeekGridView(viewModel: viewModel)
    }
  }

}

#Preview {
  WeeklyView()
}
