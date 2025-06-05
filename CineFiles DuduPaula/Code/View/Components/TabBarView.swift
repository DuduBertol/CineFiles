//
//  ContentView.swift
//  affs
//
//  Created by Afonso Rekbaim on 28/05/25.
//

import SwiftUI

struct TabBarView: View {
    // AQUI ESTÁ A MUDANÇA PRINCIPAL:
    // selectedView agora é um @Binding, o que significa que ele VEM de uma View pai
    @Binding var selectedView: Int
    
    var body: some View {
        
        //Tab bar customizada
        HStack(spacing: 80){
            
            //HOME
            Button{
                withAnimation{
                    selectedView = 1
                }
            } label: {
                Image(systemName: "house")
                    .foregroundStyle(selectedView == 1 ? .blue : .gray)
            }
            
            //CATALOGUE
            Button{
                withAnimation{
                    selectedView = 2
                }
            } label: {
                Image(systemName: "movieclapper")
                    .foregroundStyle(selectedView == 2 ? .blue : .gray)
            }
            
            //PROFILE
            Button{
                withAnimation{
                    selectedView = 3
                }
            } label: {
                Image(systemName: "person.crop.circle")
                    .foregroundStyle(selectedView == 3 ? .blue : .gray)
            }
        }
        .padding(.bottom)
        .font(Font.system(size: 24))
        .fontWeight(.medium)
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(Color.sDarkBlue)
    }
}

#Preview {
    TabBarView(selectedView: .constant(1))
}
