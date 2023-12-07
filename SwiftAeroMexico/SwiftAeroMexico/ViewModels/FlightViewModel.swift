//
//  FlightViewModel.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation

class FlightViewModel: ObservableObject {
    @Published var selectedFlightNumber: String = ""
    @Published var selectedDepartureDate: Date = Date()
    @Published var departureAirport: String = ""
    @Published var arrivalAirport: String = ""
    @Published var departureAirportIndex: Int = 0
    @Published var destinationAirportIndex: Int = 0
    
    var flightStatusCollection: [FlightStatus] = []
    var flightSearchResult: [FlightStatus]?
    
    init() {
        loadData()
    }
    
    
    func loadData() {
        if let fileURL = Bundle.main.url(forResource: "NumerodeVueloResponse", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let flights = try decoder.decode(FlightStatusCollection.self, from: data)
                flightStatusCollection = flights.flightStatusCollection
            } catch {
                print("Error loading data: \(error)")
            }
        }
    }
    
    func searchFlight() -> [FlightStatus]? {
        let filteredFlights = flightStatusCollection.filter { flight in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            if let departureDate = dateFormatter.date(from: flight.segment.departureDateTime) {
                return flight.segment.operatingFlightCode == selectedFlightNumber &&
                Calendar.current.isDate(departureDate, inSameDayAs: selectedDepartureDate)
            }
            return false
        }
        
        flightSearchResult = filteredFlights
        return flightSearchResult
    }
    
    func searchFlightByDestination() -> [FlightStatus]? {
        let filteredFlights = flightStatusCollection.filter { flight in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            if let departureDate = dateFormatter.date(from: flight.segment.departureDateTime) {
                return flight.segment.departureAirport == departureAirport && flight.segment.arrivalAirport == arrivalAirport &&
                Calendar.current.isDate(departureDate, inSameDayAs: selectedDepartureDate)
            }
            return false
        }
        
        flightSearchResult = filteredFlights
        return flightSearchResult
    }
    
    func getFlightNumberAndCarrier() -> String {
        return (flightSearchResult?.first?.segment.operatingCarrier ?? "") + (flightSearchResult?.first?.segment.operatingFlightCode ?? "")
    }
}
