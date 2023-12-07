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
    @State private var isShowingSecondView = false
    @State private var path = NavigationPath()
    @State var preselectedIndex = 0
    
    init(viewModel: FlightViewModel) {
        self.flightViewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    isShowingSecondView = true
                }
            }) {
                Text("Search Flight")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
            }
            
            NavigationLink(
                destination: FlightResultsView(viewModel: flightViewModel),
                isActive: $isShowingSecondView,
                label: { EmptyView() }
            )
            .hidden()
            
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
    }
}

#Preview {
    ContentView(viewModel: FlightViewModel())
}
