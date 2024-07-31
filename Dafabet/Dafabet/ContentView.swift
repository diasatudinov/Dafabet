//
//  ContentView.swift
//  Dafabet
//
//  Created by Dias Atudinov on 29.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var selectedDates = ""

    var body: some View {
        VStack {
            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                //.datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                //.datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            Button(action: {
                showSelectedDates()
            }) {
                Text("Show Dates")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            Text(selectedDates)
                .font(.largeTitle)
                .padding()
        }
        .padding()
    }

    private func showSelectedDates() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"

        let startString = formatter.string(from: startDate)
        let endString = formatter.string(from: endDate)

        selectedDates = "Start: \(startString), End: \(endString)"
    }
}

#Preview {
    ContentView()
}
