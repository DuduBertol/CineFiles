import SwiftUI

struct MovieDetailView: View {
    
    @Binding var movie: Movie
    
    @State var isFavorited: Bool = false
    @State var isWatched: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .top){
            // Background image
            Image(movie.coverImage+"-detail")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            // Dark overlay gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.sDarkBlue.opacity(0.05),
                    Color.sDarkBlue.opacity(0.20),
                    Color.sDarkBlue.opacity(0.50),
                    Color.sDarkBlue.opacity(0.95),
                    Color.sDarkBlue.opacity(1)
                    
                ]),
                startPoint: .top,
                endPoint: .center
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Spacer para dar espaço da imagem de fundo
                    Spacer()
                        .frame(height: 210)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // Título do filme
                        Text(movie.title)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        // Linha com ano, rating e duração
                        HStack(spacing: 12) {
                            
                            // Ano com fundo rosa
                            Text(String(movie.year))
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Text("|")
                                .foregroundColor(.sGreen)
                                .font(.system(size: 16, weight: .thin))
                            
                            // Rating com estrelas
                            HStack(spacing: 1) {
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star")
                            }
                            .font(.system(size: 16, weight: .semibold))
                            .overlay(
                                LinearGradient(
                                    colors: [.sGreen, .sBlue],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .mask(
                                HStack(spacing: 1) {
                                    Image(systemName: "star.fill")
                                    Image(systemName: "star.fill")
                                    Image(systemName: "star.fill")
                                    Image(systemName: "star.fill")
                                    Image(systemName: "star")
                                }
                                    .font(.system(size: 16, weight: .semibold))
                            )
                            
                            Text("|")
                                .foregroundColor(.sGreen)
                                .font(.system(size: 16, weight: .thin))
                            
                            // Duração
                            Text("3h 12min")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        
                        // Tags de categoria
                        HStack(spacing: 12) {
                            ForEach(movie.category, id: \.self) { category in
                                Text(category)
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color.sGray.opacity(0.2))
                                    .clipShape(Capsule())
                            }
                            Spacer()
                            
                        }
                        .padding(.vertical, 8)
                        // Botões de ação
                        HStack(spacing: 12) {
                            
                            // Botão Visto
                            Button{
//                                movie.wasWatched.toggle()
                                $movie.wrappedValue.wasWatched.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: movie.wasWatched ? "play.fill" : "play")
                                    Text("Visto")
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: 119)
                                .padding(.vertical, 16)
                                .background(movie.wasWatched ? Color.sGreen : Color.sGray.opacity(0.5))
                                .clipShape(Capsule())
                            }
                            
                            // Botão Favoritar
                            Button{
                                $movie.wrappedValue.isFavorite.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                                    Text("Favoritar")
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(movie.isFavorite ? Color.sPink : Color.sGray.opacity(0.5))
                                .clipShape(Capsule())
                            }
                        }
                        
                        // Seção Sinopse
                        VStack(alignment: .leading, spacing: 20) {
                            
                            HStack {
                                Image(systemName: "movieclapper")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 26, weight: .semibold))
                                    .overlay(
                                        LinearGradient(
                                            colors: [.sGreen, .sBlue],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .mask(
                                        HStack(spacing: 1) {
                                            Image(systemName: "movieclapper")
                                        }
                                            .font(.system(size: 26, weight: .regular))
                                    )
                                
                                Text("Sinopse")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            
                            .padding(.vertical, 8)
                            
                            Text(movie.synopsis)
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.9))
                                .lineSpacing(5)
                            
                            // Linha divisória gradiente
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        colors: [.sGreen, .sBlue],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(height: 0.5)
                                .padding(.trailing, 80)
                            
                                .padding(.vertical, 8)
                            // Seção Direção e Roteiristas
                            HStack(alignment: .top, spacing: 40) {
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Direção")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text(movie.direction)
                                        .font(.system(size: 14))
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                
                                .padding(.vertical, 8)
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Roteiristas")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text(movie.screenwriters)
                                        .font(.system(size: 14))
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                
                                .padding(.vertical, 8)
                                Spacer()
                            }
                        }
                        .padding(.top, 20)
                    }
                    .padding(.horizontal, 20)
                    
                    // Espaço extra no final
                    Spacer()
                        .frame(height: 100)
                }
            }
        }.background(.sDarkBlue)
    }
}

#Preview {
    MovieDetailView(movie: .constant(Movie(
        coverImage: "tudo_em_todo_lugar",
        title: "Tudo em Todo o Lugar ao Mesmo Tempo",
        synopsis: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
        direction: "Daniel Kwan, Daniel Scheinert",
        screenwriters: "Daniel Kwan, Daniel Scheinert",
        year: 2022,
        category: [
            "Ficção Científica",
            "Aventura"
        ],
        wasWatched: false,
        isFavorite: false
    )))
}
