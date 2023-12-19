//
//  CitiesEnum.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 07/12/23.
//

import Foundation

enum CitiesEnum: String, CaseIterable {
    case mexicoCity = "MEX"
    case guadalajara = "GDL"
    case monterrey = "MTY"
    case puebla = "PBC"
    case cancun = "CUN"
    
    func cityName() -> String {
        switch self {
            case .mexicoCity: return "Ciudad de México"
            case .guadalajara: return "Guadalajara"
            case .monterrey: return "Monterrey"
            case .puebla: return "Puebla"
            case .cancun: return "Cancún"
        }
    }
}
