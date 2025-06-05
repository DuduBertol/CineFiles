/*
 //
//  MoviesDataModel.swift
//  LifeTrack
//
//  Created by Eduardo Bertol on 28/05/25.
//

import Foundation

struct MoviesDataModel {
    var movies: [Movie] = [
        
        Movie(
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
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "cisne-negro",
            title: "Cisne Negro",
            synopsis: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.",
            direction: "Darren Aronofsky",
            screenwriters: "Mark Heyman, Andres Heinz, John J. McLaughlin",
            year: 2010,
            category: [
                "Drama",
                "Psicológico"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "barbie-princesa-plebeia",
            title: "Barbie a princesa e a plebeia",
            synopsis: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino...",
            direction: "William Lau",
            screenwriters: "Cliff Ruby, Elana Lesser, Ruth Handler",
            year: 2004,
            category: [
                "Animação",
                "Infantil"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "show-de-truman",
            title: "Show de Truman",
            synopsis: "Truman Burbank leva uma vida simples, mas estranha...",
            direction: "Peter Weir",
            screenwriters: "Peter Weir, Andrew Niccol",
            year: 1998,
            category: [
                "Drama",
                "Ficção Científica"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "spirit-corcel-indomavel",
            title: "Spirit: O Corcel Indomável",
            synopsis: "Animação sobre a amizade entre um menino indígena e um cavalo...",
            direction: "Kelly Asbury, Lorna Cook",
            screenwriters: "John Fusco",
            year: 2002,
            category: [
                "Animação",
                "Aventura"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "labirinto-do-fauno",
            title: "Labirinto do Fauno",
            synopsis: "Ofélia encontra um fauno mágico que a testa com desafios...",
            direction: "Guillermo del Toro",
            screenwriters: "Guillermo del Toro",
            year: 2006,
            category: [
                "Fantasia",
                "Drama"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "o-predestinado",
            title: "O Predestinado",
            synopsis: "Um agente viaja no tempo para impedir um atentado terrorista...",
            direction: "Michael Spierig, Peter Spierig",
            screenwriters: "Michael Spierig, Peter Spierig, Robert A Heinlein",
            year: 2015,
            category: [
                "Ficção Científica",
                "Suspense"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "gigantes-de-aco",
            title: "Gigantes de aço",
            synopsis: "Robôs lutadores substituem humanos em ringues de boxe...",
            direction: "Shawn Levy",
            screenwriters: "Dan Gilroy, Les Bohem, Jeremy Leven, John Gatins, Richard Matheson",
            year: 2011,
            category: [
                "Ação",
                "Família"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "vastidao-da-noite",
            title: "A vastidão da noite",
            synopsis: "Duas crianças investigam uma frequência misteriosa...",
            direction: "Andrew Patterson",
            screenwriters: "James Montague, Craig W. Sanger",
            year: 2019,
            category: [
                "Mistério",
                "Ficção Científica"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "parasita",
            title: "Parasita",
            synopsis: "Família pobre se infiltra na casa de uma família rica...",
            direction: "Bong Joon-ho",
            screenwriters: "Bong Joon-ho, Jin Won Han",
            year: 2019,
            category: [
                "Drama",
                "Suspense"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "passivonas",
            title: "Passivonas",
            synopsis: "Alunas criam clube da luta para conquistar líderes de torcida...",
            direction: "Emma Seligman",
            screenwriters: "Emma Seligman, Rachel Sennott",
            year: 2023,
            category: [
                "Comédia",
                "Adolescente"
            ],
            wasWatched: false,
            isFavorite: true
        ),
        
        Movie(
            coverImage: "turma-monica-aventura-tempo",
            title: "Turma da Mônica: Uma Aventura no Tempo",
            synopsis: "A turma precisa consertar uma máquina do tempo que espalhou elementos...",
            direction: "Mauricio de Sousa",
            screenwriters: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu",
            year: 2007,
            category: [
                "Infantil",
                "Aventura"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "memento",
            title: "Amnésia Memento",
            synopsis: "Homem com perda de memória busca vingança pelo assassinato da esposa...",
            direction: "Christopher Nolan",
            screenwriters: "Christopher Nolan, Jonathan Nolan",
            year: 2001,
            category: [
                "Suspense",
                "Psicológico"
            ],
            wasWatched: false,
            isFavorite: true
        ),
        
        Movie(
            coverImage: "tenenbaums",
            title: "Os Excêntricos Tenenbaums",
            synopsis: "Família disfuncional se reúne em meio a dramas e excentricidades...",
            direction: "Wes Anderson",
            screenwriters: "Wes Anderson, Owen Wilson",
            year: 2002,
            category: [
                "Comédia",
                "Drama"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "la-la-land",
            title: "La La Land",
            synopsis: "Casal tenta equilibrar o amor e a carreira artística em LA...",
            direction: "Damien Chazelle",
            screenwriters: "Damien Chazelle",
            year: 2017,
            category: [
                "Musical",
                "Romance"
            ],
            wasWatched: true,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "kiki-entregas",
            title: "Os Serviços de Entrega da Kiki",
            synopsis: "Kiki tenta viver sozinha como bruxa aprendiz em uma cidade nova...",
            direction: "Hayao Miyazaki",
            screenwriters: "Hayao Miyazaki, Jack Fletcher, John Semper",
            year: 1990,
            category: [
                "Animação",
                "Fantasia"
            ],
            wasWatched: false,
            isFavorite: true
        ),
        
        Movie(
            coverImage: "feitico-de-aquila",
            title: "O Feitiço de Áquila",
            synopsis: "Navarra planeja matar o bispo que os amaldiçoou...",
            direction: "Richard Donner",
            screenwriters: "Michael Thomas, Tom Mankiewicz",
            year: 1985,
            category: [
                "Fantasia",
                "Aventura"
            ],
            wasWatched: false,
            isFavorite: false
        ),
        
        Movie(
            coverImage: "os-incriveis",
            title: "Os Incríveis",
            synopsis: "Sr. Incrível volta à ação com sua família para salvar o mundo...",
            direction: "Brad Bird",
            screenwriters: "Brad Bird",
            year: 2004,
            category: [
                "Animação",
                "Ação"
            ],
            wasWatched: true,
            isFavorite: false
        ),
        
    ]
}
*/
