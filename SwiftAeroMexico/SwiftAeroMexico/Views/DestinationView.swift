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
    let startDate = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) ?? Date()
    
    let cities = ["Mexico City", "Guadalajara", "Monterrey", "Puebla", "Tijuana", "Cancun"]
    
    var body: some View {
        VStack {
            originDestinationPicker(
                title: "Origin",
                selection: $flightViewModel.departureAirportIndex
            )
            .border(.black, width: 2)
            
            originDestinationPicker(
                title: "Destination",
                selection: $flightViewModel.destinationAirportIndex
            )
            .border(.black, width: 2)
            
            VStack {
                Text("Date of departure")
                DatePicker(
                    selection: $flightViewModel.selectedDepartureDate,
                    in: startDate...,
                    displayedComponents: .date
                ) {
                    Text("")
                }
                .datePickerStyle(.compact)
            }
            .border(.black, width: 2)
        }
    }
    
    func originDestinationPicker(title: String, selection: Binding<Int>) -> some View {
        VStack {
            Text(title)
            Picker(title, selection: selection) {
                ForEach(cities.indices, id: \.self) { index in
                    Text(cities[index]).tag(index)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView(flightViewModel: FlightViewModel())
    }
}
