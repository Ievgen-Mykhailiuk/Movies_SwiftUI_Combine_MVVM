//
//  MoviesViewModel.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    
    private let networkManager: NetworkService
    @Published var movies: [MovieModel] = []
    
    init(networkManager: NetworkService = DefaultNetworkService()) {
        self.networkManager = networkManager
        getMovies()
    }
    
    
    
    private func getMovies() {
        networkManager.request(from: .movies) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let success):
                success.results.forEach { movie in
                    self.movies.append( MovieModel.from(networkModel: movie))
                   }
            case .failure(let failure):
                 print(failure)
            }
        }
    }
 
}
