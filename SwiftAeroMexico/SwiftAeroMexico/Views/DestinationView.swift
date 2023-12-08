//
//  DestinationView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
import SwiftUI

struct DestinationView: View {
    @ObservedObject var flightViewModel: FlightViewModel
    @State private var isDatePickerVisible = false
    let startDate = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) ?? Date()
    
    init(viewModel: FlightViewModel) {
        self.flightViewModel = viewModel
    }
    
    var body: some View {
        VStack{
            HStack {
                VStack(spacing: 5) {
                    Text("Origin")
                        .padding(.top, 40)
                        .padding(.leading, 10)
                        .font(.system(size: 12))
                        .padding(.horizontal, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    originDestinationPicker(
                        title: "",
                        selection: $flightViewModel.departureAirport
                    )
                    .padding(.bottom, 50)
                    .tint(.black)
                    .frame(height: 60)
                    .background(.white)
                    .cornerRadius(5)
                }
                .bold()
                .frame(width: 180, height: 80)
                .background(.white)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 2)
                )
                
                
                VStack(spacing: 5) {
                    Text("Destination")
                        .padding(.top, 40)
                        .padding(.leading, 10)
                        .font(.system(size: 12))
                        .padding(.horizontal, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    originDestinationPicker(
                        title: "",
                        selection: $flightViewModel.arrivalAirport
                    )
                    .padding(.bottom, 50)
                    .tint(.black)
                    .frame(height: 60)
                    .background(.white)
                    .cornerRadius(5)
                }
                .bold()
                .frame(width: 180, height: 80)
                .background(Color.white)
                .cornerRadius(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 2)
                }
            }
            .padding()
            
            VStack(spacing: 5) {
                Text("Date of departure")
                    .font(.system(size: 12))
                    .padding(.horizontal, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(formatDate(date: flightViewModel.selectedDepartureDate))
                    .padding(.horizontal, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
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
            .padding()
            .onTapGesture {
                isDatePickerVisible.toggle()
            }
        }
    }
    
    func originDestinationPicker(title: String, selection: Binding<String>) -> some View {
        VStack {
            Text(title)
            Picker(title, selection: selection) {
                ForEach(CitiesEnum.allCases, id: \.self) { city in
                    Text(city.cityName()).tag(city.rawValue)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView(viewModel: FlightViewModel())
    }
}
