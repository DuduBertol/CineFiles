//
//  OnBoardingDataModel.swift
//  CineFiles DuduPaula
//
//  Created by Eduardo Bertol on 30/05/25.
//

import Foundation

// MARK: 1) NAO ESTOU USANDO ESSE MODEL


// MARK: 2) NAO ESTOU? ACHAVA QUE SIM...

struct OnBoardingDataModel {
    let onBoardingScreens: [OnBoarding] = [
//        OnBoarding(icon: "movieclapper.fill", title: "Marque seus filmes vistos", description: "E saiba quais filmes babadeiros já assistiu e quais faltam"),
        OnBoarding(icon: "play.fill", title: "Marque seus filmes vistos", description: "E saiba quais filmes babadeiros já assistiu e quais faltam"),
        OnBoarding(icon: "heart.fill", title: "Salve seus filmes favoritos", description: "Para montar sua lista de filmes perfeita"),
        OnBoarding(icon: "sparkle.magnifyingglass", title: "Pesquise títulos no catálogo", description: "E encontre filmes que você vai adorar")
    ]
}
