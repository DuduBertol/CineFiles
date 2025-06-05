//
//  HomeView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import SwiftUI

struct HomeView: View {
    
//    let moviesDataModel: MoviesDataModel = .init()
    @Binding var movies: [Movie]
    
    @Binding var selectedView: Int
    @Binding var showOnBoarding: Bool
    
    var body: some View {
        
        ZStack{
            VStack{
                VStack{
                    TabView{
                        Tab{
                            Image("Home01")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                        }
                        
                        Tab{
                            Image("Home02")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                        }
                        
                        Tab{
                            Image("Home03")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                }
                
                VStack(alignment: .leading){
                    
                    Button{
                        withAnimation{
                            selectedView = 2
                        }
                    } label:{
                        SearchBarView(isDisabled: true, textSearch: .constant(""))
                    }
                    
                    Text("Top trending movies")
                        .foregroundStyle(.white)
                        .fontWeight(.medium)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 24){
                            ForEach($movies, id: \.id) { $movie in
                                MovieView(movie: $movie)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .background(.sDarkBlue)
            .ignoresSafeArea()
            
            if showOnBoarding {
                OnBoardingFluxView(showOnBoarding: $showOnBoarding)
            }
        }
        
        
    }
}

#Preview {
    HomeView(movies: .constant(Array.movies()), selectedView: .constant(1), showOnBoarding: .constant(false))
        .preferredColorScheme(.light)
    TabBarView(selectedView: .constant(1))
}
