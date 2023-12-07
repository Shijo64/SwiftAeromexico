//
//  FlightResultsView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import SwiftUI

struct FlightResultsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var flightViewModel: FlightViewModel
    
    init(viewModel: FlightViewModel) {
        self.flightViewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .bold()
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                Spacer()
                TopTitleView()
                    .padding(.top, 40)
                    .padding(.leading)
            }
            
            HStack {
                Text("Mexico City to Cancun")
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                Spacer()
            }
            
            FlightCardView()
                .padding(.leading)
            Spacer()
        }
    }
}

#Preview {
    FlightResultsView(viewModel: FlightViewModel())
}
