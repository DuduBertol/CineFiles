//
//  ContentView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    
    // selectedView agora é um @State na ContentView
    // Esta é a "fonte da verdade" para qual aba está selecionada
    @State private var selectedView: Int = 0
    
    @State var movies : [Movie] = .movies()
    
    @State private var showOnBoarding: Bool = true
    
    var body: some View {
        
        NavigationStack{
            VStack {
                // A área onde as telas são exibidas
                // Usamos um Spacer para empurrar as telas para o topo
                Spacer()
                
                switch selectedView {
                case 0:
                    StartView(selectedView: $selectedView)
                case 1:
                    HomeView(movies: $movies, selectedView: $selectedView, showOnBoarding: $showOnBoarding)
                    // Se HomeView precisar do selectedView para algo, passe como binding
                case 2:
                    CatalogueView(movies: $movies) // Mesma observação para CatalogueView
                case 3:
                    ProfileView(movies: $movies) // Mesma observação para ProfileView
                default:
                    Text("Erro: Tela não encontrada")
                }
                
                Spacer()
                
                // Sua TabBar customizada
                // Passamos o $selectedView (o Binding do nosso @State) para a TabBarView
                if !showOnBoarding{
                    TabBarView(selectedView: $selectedView)
                }
            }
            .ignoresSafeArea()
            .background(.sDarkBlue)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
