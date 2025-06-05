//
//  ButtonFilterView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import SwiftUI

struct ButtonFilterView: View {
    
    let symbol: String
    let text: String
    
    let gradientColors: [Color]
    
    @State var isActive: Bool = false

    @Binding var optionSelected: CatalogueView.Option
    let target: CatalogueView.Option
    
    var body: some View {
        Button{
            withAnimation{
                if isActive {
                    optionSelected = .all
                    isActive = false
                } else {
                    optionSelected = target
                    isActive = true
                }
            }
        }label:{
            HStack{
                Image(systemName: symbol)
                Text(text)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            
            .font(.system(size: 16))
            .fontWeight(.medium)
            .foregroundStyle(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        //        .background(LinearGradient(
        //            gradient: Gradient(colors: [isActive ? gradientColors[0] : gradientColors[1], gradientColors[1]]),
        //            startPoint: .leading,
        //            endPoint: .trailing
        //        ))
        .background(isActive ? gradientColors[0] : gradientColors[1])
        .cornerRadius(45)
    }
}

#Preview {
    ButtonFilterView(symbol: "movieclapper", text: "Tudo", gradientColors: [.sGreen, .sBlue], isActive: false, optionSelected: .constant(.all), target: .all)
}
