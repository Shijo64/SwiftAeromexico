//
//  FlightHelper.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 08/12/23.
//

import Foundation

class FlightHelper {
    func getFlightNumber(flight: FlightStatus?) -> String {
        let flightNumber = "\(flight?.segment.operatingCarrier ?? "AM")" +  "\(flight?.segment.operatingFlightCode ?? "200")"
        return flightNumber
    }
    
    func getFlightCities(originCode:String, destinationCode: String) -> String {
        guard let originCity = CitiesEnum(rawValue: originCode)?.cityName(),
              let destinationCity = CitiesEnum(rawValue: destinationCode)?.cityName() else {
            return "Ciudad de México a Cancún"
        }
        return "\(originCity) a \(destinationCity)"
    }
    
    func getFlightAirportCity(cityCode: String) -> String {
        guard let originCity = CitiesEnum(rawValue: cityCode)?.cityName() else {
            return "Ciudad de México"
        }
        
        return originCity
    }
    
    func getFlightDate(flight: FlightStatus?) -> String {
        let dateString = flight?.segment.departureDateTime ?? "2023-11-21T06:01:00"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        var formattedDate = ""
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "EEEE, MMM d"
            formattedDate = dateFormatter.string(from: date)
        } else {
            formattedDate = "Tuesday, Nov 22"
        }
        
        return formattedDate
    }
    
    func getDepartureArrivalTime(date: String) -> String {
        let dateString = date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            let hourMinuteFormatter = DateFormatter()
            hourMinuteFormatter.dateFormat = "HH:mm"
            return hourMinuteFormatter.string(from: date)
        } else {
            return "00:00"
        }
    }
    
    func calculateFlightDuration(totalMinutes: Int) -> String? {
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        
        return "\(hours)h \(minutes)min"
    }
    
    func formatTimeHHMM(from timeString: String) -> String? {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        
        if let date = timeFormatter.date(from: timeString) {
            timeFormatter.dateFormat = "HH:mm"
            return timeFormatter.string(from: date)
        }
        
        return nil
    }
}
