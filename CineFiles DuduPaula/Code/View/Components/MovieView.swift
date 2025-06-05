//
//  MovieView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 29/05/25.
//

import SwiftUI

struct MovieView: View {
    
    @Binding var movie: Movie
    
    var body: some View {
        
        NavigationLink{
            MovieDetailView(movie: $movie)
        }label: {
            VStack(alignment: .leading){
                ZStack(alignment: .bottomTrailing){
                    Image(movie.coverImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 165)
                        .cornerRadius(12)

                    HStack{
                        Image(systemName: $movie.wrappedValue.isFavorite ? "heart.fill" : "")
                            .foregroundColor(.sPink)
                        Image(systemName: $movie.wrappedValue.wasWatched ? "play.fill" : "")
                            .foregroundColor(.sGreen)
                    }
                    .padding(8)

                }
                
                //                        let limit: Int = 15
                let str: String = "\(movie.title.prefix(15))" + (movie.title.count>15 ? "..." : "")
                
                Text(str)
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
            }
        }
        
    }
}

#Preview {
    MovieView(movie: .constant(Movie(
        coverImage: "tudo-em-todo-lugar",
        title: "Tudo em Todo o Lugar ao Mesmo Tempo",
        synopsis: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
        direction: "Daniel Kwan, Daniel Scheinert",
        screenwriters: "Daniel Kwan, Daniel Scheinert",
        year: 2022,
        category: [
            "Ficção Científica",
            "Aventura"
        ],
        wasWatched: true,
        isFavorite: true
    ))
)    //    .preferredColorScheme(.dark)
}
