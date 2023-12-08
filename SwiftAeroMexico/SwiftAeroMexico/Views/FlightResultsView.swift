//
//  FlightResultsView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import SwiftUI

struct FlightResultsView: View {
    @Environment(\.presentationMode) var presentationMode
    private var flights: [FlightStatus]
    private var flightHelper = FlightHelper()
    
    init(flights: [FlightStatus]) {
        self.flights = flights
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .bold()
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                Spacer()
                TopTitleView(flights: self.flights)
                    .padding(.top, 40)
                    .padding(.leading)
            }
            
            HStack {
                Text(flightHelper.getFlightCities(originCode: flights.first?.segment.departureAirport ?? "MEX", destinationCode: flights.first?.segment.arrivalAirport ?? "CUN"))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                Spacer()
            }
            
            List(flights, id: \.self) { item in
                FlightCardView(flight: item)
            }
            .listStyle(PlainListStyle())
            .background(.white)
            Spacer()
        }
    }
}

#Preview {
    FlightResultsView(flights: [FlightStatus(status: "ARRIVED", boardingTerminal: "2", boardingGate: "N/A", boardingTime: "06:24:00", estimatedDepartureTime: "2023-11-21T06:24:00", estimatedArrivalTime: "2023-11-21T09:21:00", delayInMinutes: 23, arrivalTerminal: "4", arrivalGate: "N/A", segment: FlightSegment(segmentCode: "MEX_CUN_AM_2023-11-21_0601", departureAirport: "MEX", arrivalAirport: "CUN", departureDateTime: "2023-11-21T06:01:00", arrivalDateTime: "2023-11-21T09:29:00", flightStatus: "ARRIVED", operatingCarrier: "AM", marketingCarrier: "AM", operatingFlightCode: "500", marketingFlightCode: "500", flightDurationInMinutes: 148, aircraftType: "7S8", stops: []), outGate: OutGate(accuracy: "Actual", dateTimeUtc: "2023-11-21T11:53Z", dateTimeLocal: "2023-11-21T05:53", sourceType: "AirlineData"), legType: "NON-STOP", totalFlightTimeInMinutes: 148)])
}
