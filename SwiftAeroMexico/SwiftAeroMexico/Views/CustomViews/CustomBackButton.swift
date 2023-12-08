//
//  CustomBackButton.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 07/12/23.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Circle()
                .foregroundColor(.white)
                .frame(width: 44, height: 44) // Set the circle size
                .overlay(
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .bold()
                )
        }
        .padding()
    }
}

#Preview {
    CustomBackButton()
}
