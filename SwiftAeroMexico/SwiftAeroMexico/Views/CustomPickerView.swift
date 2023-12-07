//
//  CustomPickerView.swift
//  SwiftAeroMexico
//
//  Created by Arturo Calvo on 05/12/23.
//

import Foundation
import SwiftUI

struct CustomPickerView: View {
    @Binding var selectedOption: Int
    var options: [String]
    let color = Color.black
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = selectedOption == index
                ZStack {
                    Rectangle()
                        .fill(.white)
                    
                    Rectangle()
                        .fill(color)
                        .padding(2)
                        .opacity(isSelected ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.2,
                                                             dampingFraction: 2,
                                                             blendDuration: 0.5)) {
                                selectedOption = index
                            }
                        }
                }
                .overlay(
                    Text(options[index])
                        .font(.caption)
                        .fontWeight(isSelected ? .bold : .regular)
                        .foregroundColor(isSelected ? .white : .black)
                )
            }
        }
        .frame(height: 40)
        .border(Color.gray, width: 1)
    }
}
