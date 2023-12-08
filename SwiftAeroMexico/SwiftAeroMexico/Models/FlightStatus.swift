//
//  FlightStatus.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
struct FlightStatus: Codable, Hashable {
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
    
    static func ==(lhs: FlightStatus, rhs: FlightStatus) -> Bool {
        return lhs.status == rhs.status &&
            lhs.boardingTerminal == rhs.boardingTerminal &&
            lhs.boardingGate == rhs.boardingGate &&
        lhs.boardingTime == rhs.boardingTime &&
        lhs.estimatedDepartureTime == rhs.estimatedDepartureTime &&
        lhs.estimatedArrivalTime == rhs.estimatedArrivalTime &&
        lhs.delayInMinutes == rhs.delayInMinutes &&
        lhs.arrivalTerminal == rhs.arrivalTerminal &&
        lhs.arrivalGate == rhs.arrivalGate &&
        lhs.segment == rhs.segment &&
        lhs.outGate == rhs.outGate &&
        lhs.legType == rhs.legType &&
        lhs.totalFlightTimeInMinutes == rhs.totalFlightTimeInMinutes
    }
}
