//
//  FlightStatus.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
struct FlightStatus: Codable {
    let status: String
    let boardingTerminal: String
    let boardingGate: String
    let boardingTime: String
    let estimatedDepartureTime: String
    let estimatedArrivalTime: String
    let delayInMinutes: Int
    let arrivalTerminal: String
    let arrivalGate: String
    let segment: FlightSegment
    let outGate: OutGate
    let legType: String
    let totalFlightTimeInMinutes: Int
}
