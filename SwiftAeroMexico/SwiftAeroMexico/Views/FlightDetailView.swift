//
//  FlightDetailView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
import SwiftUI

struct FlightDetailView: View {
    
    @State private var isShowingSheet = true
    private var flight: FlightStatus
    private var flightHelper = FlightHelper()
    
    init(flight: FlightStatus) {
        self.flight = flight
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Cancun")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton()
                }
            }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(flight.segment.operatingCarrier)
                                .font(.title)
                                .foregroundColor(.gray)
                            Text(flight.segment.operatingFlightCode)
                                .bold()
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        Text(flightHelper.getFlightDate(flight: flight))
                    }
                    Spacer()
                    Text(flight.status)
                        .bold()
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                Divider().background(Color.gray).frame(height: 1)
                
                HStack {
                    FlightStatusView(flight: flight)
                }
                
                Divider().background(Color.gray).frame(height: 1)
                FlightDetailsCustomView(flight: flight)
                
            }
        }
    }
}



#Preview {
    FlightDetailView(flight: FlightStatus(status: "ARRIVED", boardingTerminal: "2", boardingGate: "N/A", boardingTime: "06:24:00", estimatedDepartureTime: "2023-11-21T06:24:00", estimatedArrivalTime: "2023-11-21T09:21:00", delayInMinutes: 23, arrivalTerminal: "4", arrivalGate: "N/A", segment: FlightSegment(segmentCode: "MEX_CUN_AM_2023-11-21_0601", departureAirport: "MEX", arrivalAirport: "CUN", departureDateTime: "2023-11-21T06:01:00", arrivalDateTime: "2023-11-21T09:29:00", flightStatus: "ARRIVED", operatingCarrier: "AM", marketingCarrier: "AM", operatingFlightCode: "500", marketingFlightCode: "500", flightDurationInMinutes: 148, aircraftType: "7S8", stops: []), outGate: OutGate(accuracy: "Actual", dateTimeUtc: "2023-11-21T11:53Z", dateTimeLocal: "2023-11-21T05:53", sourceType: "AirlineData"), legType: "NON-STOP", totalFlightTimeInMinutes: 148))
}
