//
//  FlightDetailView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
import SwiftUI

struct FlightDetailView: View {
    
    @State private var isShowingSheet = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Cancun")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton()
                }
            }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("AM")
                                .font(.title)
                                .foregroundColor(.gray)
                            Text("500")
                                .bold()
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        Text("Tuesday, Nov 21")
                    }
                    Spacer()
                    Text("Arrived")
                        .bold()
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                Divider().background(Color.gray).frame(height: 1)
                
                HStack {
                    FlightStatusView()
                }
                
                Divider().background(Color.gray).frame(height: 1)
                FlightDetailsCustomView()
                
            }
        }
    }
}



#Preview {
    FlightDetailView()
}
