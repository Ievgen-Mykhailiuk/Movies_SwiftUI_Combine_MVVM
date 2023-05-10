//
//  MoviesViewModel.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    
    private let networkManager: NetworkService
    private var genres: [GenreModel] = []
    
    @Published var movies: [MovieModel] = []
    
    init(networkManager: NetworkService = DefaultNetworkService()) {
        self.networkManager = networkManager
        getGenres {
            self.getMovies()
        }
    }
 
    private func getMovies() {
        networkManager.request(from: .movies) { [weak self] (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let success):
                success.results.forEach { movieData in
                    var movie = MovieModel.from(networkModel: movieData)
                    let genres = movieData.genreIDS.compactMap { id in
                        self?.genres.first(where: { $0.id == id })?.name
                    }
                    movie.genres = genres
                    self?.movies.append(movie)
                   }
            case .failure(let failure):
                 print(failure)
            }
        }
    }
    
    private func getGenres(completion: @escaping () -> ()) {
        networkManager.request(from: EndPoint.genres) { [weak self] (result: Result<GenresData, Error>) in
            switch result {
            case .success(let success):
                self?.genres = success.genres
            case .failure(let failure):
                print(failure)
            }
            completion()
        }
    }
 
}
