//
//  SwiftAeroMexicoApp.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import SwiftUI

@main
struct SwiftAeroMexicoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: FlightViewModel())
        }
    }
}
