//
//  HomeView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import SwiftUI

struct ProfileView: View {
    
//    let moviesDataModel: MoviesDataModel = .init()
    @Binding var movies: [Movie]
    
    var body: some View {
        ScrollView{
            VStack{ // FOTO e NOME
                ZStack{
                    
                    Image("ProfileBG")
                    
                    VStack{
                        Spacer()
                            .frame(height: 100)
                        Image("profile1")
                            .frame(width: 160, height: 160)
                            .padding()
                            .background(.sDarkBlue)
                            .clipShape(Circle())
                            .overlay{
                                Circle()
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [.sGreen, .sBlue]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    ), lineWidth: 4)
                            }
                    }
                }

                Spacer()
                    .frame(height: 32)
                
                HStack(spacing: 0){
                    Text("Hello, ")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.green)
                    
                    Text("The Rock")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundStyle(.white)
                }
            }
            .padding(.bottom, 32)
            
            HStack(spacing: 28){
                Text("About")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(16)
                HStack{
                    Text("5k")
                        .foregroundStyle(.sGreen)
                    Text("Followers")
                }
                HStack{
                    Text("232")
                        .foregroundStyle(.sGreen)
                    Text("Following")
                }
            }
            .foregroundStyle(.white)
            .font(.system(size: 14))
            .padding(.bottom, 24)
            
            VStack(spacing: 16){
                
                //FAVORITOS
                HStack{
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.sPink)
                    Text("Favoritos")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .foregroundStyle(.white)
                
                ScrollView(.horizontal){
                    HStack(spacing: 24){
                        ForEach($movies, id: \.id) { $movie in
                            if $movie.wrappedValue.isFavorite{
                                MovieView(movie: $movie)
                            }
                        }
                    }
                }
                
                //VISTOS
                HStack{
                    Image(systemName: "play.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.sGreen)
                    Text(" Vistos")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .foregroundStyle(.white)
                
                ScrollView(.horizontal){
                    HStack(spacing: 24){
                        ForEach($movies, id: \.id) { $movie in
                            if $movie.wrappedValue.wasWatched{
                                MovieView(movie: $movie)
                            }
                        }
                    }
                }
                
            }
            .padding(.leading)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .background(.sDarkBlue)
    }
}

#Preview {
    ProfileView(movies: .constant(Array.movies()))
        .preferredColorScheme(.light)
    TabBarView(selectedView: .constant(3))
}
