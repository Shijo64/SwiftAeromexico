//
//  ContentView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var flightViewModel: FlightViewModel
    @State private var isShowingFlightResults = false
    
    init(viewModel: FlightViewModel) {
        self.flightViewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Track your flight")
                    .font(.title)
                Text("Keep you informed in real time!")
                Spacer()
                Divider().background(Color.gray).frame(height: 1)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color.gray.opacity(0.2))
            .ignoresSafeArea(edges: .top)
            
            CustomPickerView(selectedOption: $flightViewModel.isSearchByNumber, options: ["Flight Number", "Destination"])
                .padding(.top, -110)
                .frame(width: 200, height: 50)
            
            if flightViewModel.isSearchByNumber {
                FlightNumberView(viewModel: flightViewModel)
            } else {
                DestinationView(viewModel: flightViewModel)
            }
            
            Button(action: {
                switch flightViewModel.isSearchByNumber {
                case true:
                    flightViewModel.searchFlight()
                case false: flightViewModel.searchFlights()
                }
                if flightViewModel.flightList.count > 0 {
                    isShowingFlightResults = true
                }
            }) {
                Text("Search Flight")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .fullScreenCover(isPresented: $isShowingFlightResults) {
                FlightResultsView(flights: flightViewModel.flightList)
            }

            
            Text("Cant find your flight number?")
            HStack {
                Text("Try searching by")
                Button(action: {
                    flightViewModel.isSearchByNumber.toggle()
                }) {
                    Text("destination.")
                        .underline()
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ContentView(viewModel: FlightViewModel())
}
