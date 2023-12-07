//
//  FlightResultsView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import SwiftUI

struct FlightResultsView: View {
    @ObservedObject var flightViewModel: FlightViewModel
    
    init(viewModel: FlightViewModel) {
        self.flightViewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            Text("Prueba").navigationTitle(flightViewModel.getFlightNumberAndCarrier())
                .toolbarTitleDisplayMode(.large)
                .toolbar {
                    Button("Change") {
                        
                    }
                }
        }
    }
}

#Preview {
    FlightResultsView(viewModel: FlightViewModel())
}
