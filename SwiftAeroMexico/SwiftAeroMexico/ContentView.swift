//
//  ContentView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption = 0
    @ObservedObject var flightViewModel: FlightViewModel
    @State private var isShowingFlightResults = false
    @State var preselectedIndex = 0
    
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
            
            CustomPickerView(selectedOption: $preselectedIndex, options: ["Flight Number", "Destination"])
                .padding(.top, -110)
                .frame(width: 200, height: 50)
            
            if selectedOption == 0 {
                FlightNumberView(viewModel: flightViewModel)
            } else {
                DestinationView(flightViewModel: flightViewModel)
            }
            
            Button(action: {
                var result = [FlightStatus]()
                switch selectedOption {
                case 0:
                    result = flightViewModel.searchFlight() ?? []
                default:
                    result = [FlightStatus]()
                }
                if result.count > 0 {
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
                FlightResultsView(viewModel: flightViewModel)
            }

            
            Text("Cant find your flight number?")
            HStack {
                Text("Try searching by")
                Button(action: {
                    selectedOption = 1
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
