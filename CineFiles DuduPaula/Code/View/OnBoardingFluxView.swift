//
//  OnBoardingFluxView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import SwiftUI

struct OnBoardingFluxView: View {
    
    @Binding var showOnBoarding: Bool
    //    let onBoardingDataModel: OnBoardingDataModel = .init()
    
    var body: some View {
        TabView{
            Tab {
                OnBoardingStartView()
            }
            
            Tab {
                OnBoardingView(icon: "play.fill", title: "Marque seus filmes vistos", description: "E saiba quais filmes babadeiros já assistiu e quais faltam")
            }
            
            Tab {
                OnBoardingView(icon: "heart.fill", title: "Salve seus filmes favoritos", description: "Para montar sua lista de filmes perfeita")
            }
            
            Tab {
                OnBoardingView(icon: "sparkle.magnifyingglass", title: "Pesquise títulos no catálogo", description: "E encontre filmes que você vai adorar")
            }
            
            Tab {
                OnBoardingFinalView(showOnBoarding: $showOnBoarding)
            }
            
        }
        .frame(maxWidth: .infinity)
        .background(.sDarkBlue.opacity(0.7))
        .tabViewStyle(.page)
    }
}


#Preview {
    OnBoardingFluxView(showOnBoarding: .constant(false))
}
