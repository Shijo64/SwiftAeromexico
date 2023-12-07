//
//  FlightNumberView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
import SwiftUI

struct FlightNumberView: View {
    @ObservedObject var flightViewModel = FlightViewModel()
    let startDate = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) ?? Date()
    @State private var isDatePickerVisible = false
    
    init(viewModel: FlightViewModel) {
        self.flightViewModel = viewModel
    }
    
    var body: some View {
        HStack {
            VStack(spacing: 5) {
                Text("Flight Number View")
                    .font(.system(size: 12))
                    .padding(.horizontal, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("AM")
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                        .bold()
                    
                    TextField("", text: $flightViewModel.selectedFlightNumber)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 5)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: 150, height: 60)
            .background(.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 2)
            )
            
            
            VStack(spacing: 5) {
                Text("Date of departure")
                    .font(.system(size: 12))
                    .padding(.horizontal, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        isDatePickerVisible.toggle()
                    }
                
                Text(formatDate(date: flightViewModel.selectedDepartureDate))
                    .padding(.horizontal, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        isDatePickerVisible.toggle()
                    }
            }
            .frame(width: 150, height: 60)
            .background(Color.white)
            .cornerRadius(5)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 2)
                DatePicker(selection: $flightViewModel.selectedDepartureDate, displayedComponents: .date) {}
                           .labelsHidden()
                           .contentShape(Rectangle())
                           .opacity(0.011)
                   }
            .overlay(
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
                    .padding(.trailing, 5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            )
        }
        .padding()
    }
}

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E, MMM d"
    return dateFormatter.string(from: date)
}

struct FlightNumberView_Previews: PreviewProvider {
    static var previews: some View {
        FlightNumberView(viewModel: FlightViewModel())
    }
}
