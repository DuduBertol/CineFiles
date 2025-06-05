//
//  CatalogueView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import SwiftUI

struct CatalogueView: View {
    
    //    let dataModel: MoviesDataModel = .init()
    @Binding var movies: [Movie]
    
    @State var textSearch = ""
    
    public enum Option{
        case all, favorite, watched
        
    }
    
    @State var optionSelected: Option = .all
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 95)
                
                Text("Catálogo")
                    .foregroundStyle(.white)
                    .font(.system(size: 32))
                    .fontWeight(.medium)
                
                SearchBarView(isDisabled: false, textSearch: $textSearch)
                    .padding(.bottom, 16)
                
                
                HStack(spacing: 16){
                    ButtonFilterView(symbol: "movieclapper", text: "Tudo", gradientColors: [.sGreen, .sBlue], optionSelected: $optionSelected, target: .all)
                    ButtonFilterView(symbol: "heart", text: "Favoritos", gradientColors: [.sPink, .sBlue], optionSelected: $optionSelected, target: .favorite)
                    ButtonFilterView(symbol: "play", text: "Vistos", gradientColors: [.sGreen, .sBlue], optionSelected: $optionSelected, target: .watched)
                }
                .padding(.bottom, 8)
                
                LazyVGrid(columns: columns){
                    ForEach(searchResults(), id: \.id) { $movie in
                        switch optionSelected {
                        case .all:
                            MovieView(movie: $movie)
                                .padding(4)
                        case .favorite:
                            if $movie.wrappedValue.isFavorite{
                                MovieView(movie: $movie)
                                    .padding(4)
                            }
                        case .watched:
                            if $movie.wrappedValue.wasWatched{
                                MovieView(movie: $movie)
                                    .padding(4)
                            }
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                
                Spacer()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
        .background(.sDarkBlue)
    }
    
    /*
    func searchResults() -> Binding<[Movie]> {
        
        if textSearch.isEmpty {
            return $movies
        } else {
            return movies.filter {
                //$0 é o item em questão
                $0.title.lowercased().contains(textSearch.lowercased())
            }
        }
    }
     */

    func searchResults() -> Binding<[Movie]> {
        if textSearch.isEmpty {
            return $movies
        } else {
            return Binding(
                get: {
                    return $movies.wrappedValue.filter { movie in
                        movie.title.lowercased().contains(textSearch.lowercased())
                    }
                },
                set: { (newValueArrayFromFilteredBinding) in
                    for movieFromFilteredSet in newValueArrayFromFilteredBinding {
                        if let indexInOriginalMovies = $movies.wrappedValue.firstIndex(where: { $0.id == movieFromFilteredSet.id }) {
                            $movies.wrappedValue[indexInOriginalMovies] = movieFromFilteredSet
                        }
                    }
                }
            )
        }
    }
    
}

#Preview {
    CatalogueView(movies: .constant(Array.movies()))
        .preferredColorScheme(.light)
    TabBarView(selectedView: .constant(2))
}
