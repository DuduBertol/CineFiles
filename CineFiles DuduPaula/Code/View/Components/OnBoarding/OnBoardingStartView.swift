//
//  OnBoardingStartView.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import SwiftUI

struct OnBoardingStartView: View {
    var body: some View {
        ZStack{
            
            //SCREEN
            Rectangle()
                .cornerRadius(30)
                .overlay{
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(LinearGradient(
                            gradient: Gradient(colors: [.sGreen, .sBlue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ), lineWidth: 5)
                        .foregroundStyle(.clear)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 24)
                .padding(.vertical, 32)
                .background(.opacity(0.5))
                .foregroundStyle(.sDarkBlue.opacity(0.9))
            
            VStack{
                //ICON
                ZStack{
                    Image("LogoOnBoarding")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundStyle(LinearGradient(
                            gradient: Gradient(colors: [.sGreen, .sBlue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: 167, height: 167)
                        .padding()
                        .clipShape(Circle())
                        .overlay{
                            Circle()
                                .stroke(LinearGradient(
                                    gradient: Gradient(colors: [.sGreen, .sBlue]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ), lineWidth: 5)
                                .foregroundStyle(.clear)
                        }
                }
                .padding(.top, 152)
                
                VStack{
                    Text("Bem vindo ao")
                        .font(.system(size: 32, weight: .bold))
                        .frame(maxWidth: 250)
                        .padding(.bottom, 20)
                    
                    Image("LogotipoOnBoarding")
                        .padding()
                    
                    Text("Navegue por uma curadoria dos filmes mais incríveis de todos os tempos")
                        .font(.system(size: 20, weight: .regular))
                        .frame(maxWidth: 250)
                    
                }
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .foregroundStyle(.white)
                
                
                
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    OnBoardingStartView()
}
