//
//  FlightSegment.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
struct FlightSegment: Codable {
    let segmentCode: String
    let departureAirport: String
    let arrivalAirport: String
    let departureDateTime: String
    let arrivalDateTime: String
    let flightStatus: String
    let operatingCarrier: String
    let marketingCarrier: String
    let operatingFlightCode: String
    let marketingFlightCode: String
    let flightDurationInMinutes: Int
    let aircraftType: String
    let stops: [String]
}
