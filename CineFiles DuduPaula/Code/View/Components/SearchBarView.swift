//
//  SearchBarView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var isDisabled: Bool
    
    @Binding var textSearch: String
    
    var body: some View {
        
        ZStack{
            TextField("Busque os melhores filmes aqui...", text: $textSearch)
                .padding(.leading, 48)
                .padding(.vertical, 8)
                .background(Color(uiColor: .systemGray6))
                .clipShape(.buttonBorder)
                .disabled(isDisabled)
            
            HStack{
                Image(systemName: "sparkle.magnifyingglass")
                    .font(.system(size: 20))
                    .padding(.leading)
                Spacer()
            }
            .foregroundStyle(Color(uiColor: .systemGray2))
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 38)
        .background(.white)
        .cornerRadius(45)
        .overlay{
            RoundedRectangle(cornerRadius: 45)
                .stroke(LinearGradient(
                    gradient: Gradient(colors: [.sGreen, .sBlue]),
                    startPoint: .leading,
                    endPoint: .trailing
                ), lineWidth: 3)
        }
    }
}

#Preview {
    SearchBarView(isDisabled: true, textSearch: .constant(""))
}
