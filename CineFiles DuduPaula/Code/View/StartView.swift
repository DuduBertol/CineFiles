//
//  InicioView.swift
//  CineFiles DuduPaula
//
//  Created by Paula Nogueira on 30/05/25.
//

import SwiftUI

struct StartView: View {
    
    @Binding var selectedView: Int
    
    @State var showModal: Bool = false
    
    public enum ModalType {
        case login, signup
    }
    
    @State var modalType: ModalType = .signup
    
    var body: some View {
        
        ZStack(alignment: .top){
            
            // Dark overlay gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.sDarkBlue,
                    Color.sDarkBlue.opacity(0.95),
                    Color.sBlue.opacity(0.50)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .background(Color.sDarkBlue)  // Fundo escuro
            .ignoresSafeArea()
            
            
            VStack {
                // Imagem com todos os elementos decorativos
                Image("inicioBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                
                
                    .padding(.vertical, 5)
                
                // Conteúdo principal (título, botões, etc.)
                
                // Título CineFilés
                VStack(spacing: 30) {
                    
                    VStack (spacing: 8){
                        Image("inicioLogo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 70)
                            .padding(.vertical, 10)
                        
                        (Text("Descubra os ") +
                         Text("melhores ").foregroundColor(.pink) +
                         Text("filmes").foregroundColor(.pink) +
                         Text(" de todos os tempos"))
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 70)
                        
                    }
                    
                    
                    .padding(.vertical, 20)
                    
                    // MARK: BOTOES
                    VStack(spacing: 30){
                        HStack(spacing: 10){
                            
                            //GET STARTED
                            Button(action: {
                                withAnimation{
                                    showModal = true
                                    modalType = .signup
                                }
                            }) {
                                HStack {
                                    Text("Get started")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    
                                    Image(systemName: "arrow.up.right")
                                        .font(.title3)
                                }
                                .foregroundColor(.white)
                                
                                .padding(.vertical, 16)
                                .frame(height: 60)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(colors: [.sGreen, .sBlue],
                                                   startPoint: .leading,
                                                   endPoint: .trailing)
                                )
                                .clipShape(Capsule())
                            }
                            
                            
                            // Platform buttons
                            HStack(spacing: 10) {
                                Button(action: {
                                        withAnimation{
                                            selectedView = 1
                                        }
                                    }) {
                                    Image(systemName: "apple.logo")
                                        .font(.title)
                                        .foregroundColor(.sDarkBlue)
                                        .frame(width: 60, height: 60)
                                        .background(Color.sGreen)
                                        .clipShape(Circle())
                                }
                                
                                Button(action: {
                                    withAnimation{
                                        showModal = true
                                        modalType = .signup
                                    }
                                }) {
                                    Text("G")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(.sDarkBlue)
                                        .frame(width: 60, height: 60)
                                        .background(Color.sGreen)
                                        .clipShape(Circle())
                                }
                            }
                            
                            
                            
                        }
                        
                        // Login text
                        HStack(spacing: 4) {
                            Text("Já tem uma conta?")
                                .foregroundColor(.white)
                            
                            Button("Entrar") {
                                withAnimation{
                                    showModal = true
                                    modalType = .login
                                }
                            }
                            .foregroundColor(.sPink)
                        }
                        .font(.callout)
                        .bold()
                        
                    }
                    .padding(.horizontal, 20)
                }
                
            }
            
        }
        .sheet(isPresented: $showModal) {
            LoginModal(selectedView: $selectedView, modalType: $modalType)
                .presentationDetents([
                    modalType == .login ? withAnimation{.medium} : withAnimation{.height(530)}
                ])
        }
        
    }
    
}



#Preview {
    StartView(selectedView: .constant(0))
    
}
