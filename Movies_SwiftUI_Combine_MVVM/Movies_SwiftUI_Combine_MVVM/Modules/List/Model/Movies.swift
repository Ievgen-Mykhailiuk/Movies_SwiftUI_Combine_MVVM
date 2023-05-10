//
//  Movies.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import Foundation

struct MovieModel: Codable {
    
    var genres: [String] = []
    let id: Int
    let popularity: String
    let posterPath: String
    let releaseYear: String
    let title: String
    let votesAverage: String
    let votesCount: String
    let overview: String
    var page: Int? = nil
    var totalPages: Int? = nil
    
    static func from(networkModel: MovieData) -> MovieModel {
        let model = MovieModel(id: networkModel.id,
                               popularity: networkModel.popularity.stringDecimalValue,
                               posterPath: networkModel.posterPath,
                               releaseYear: Date.getYear(from: networkModel.releaseDate),
                               title: networkModel.title,
                               votesAverage: networkModel.votesAverage.stringDecimalValue,
                               votesCount: networkModel.voteCount.stringValue,
                               overview: networkModel.overview)
        return model
    }
    
}

struct MovieResponse: Codable {
    
    let page: Int
    let results: [MovieData]
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page) ?? .zero
        self.results = try container.decodeIfPresent([MovieData].self, forKey: .results) ?? []
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages) ?? .zero
    }
    
}

struct MovieData: Codable {
    
    let genreIDS: [Int]
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate, title: String
    let votesAverage: Double
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id, overview, popularity
        case posterPath = "backdrop_path"
        case releaseDate = "release_date"
        case title
        case votesAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.genreIDS = try container.decodeIfPresent([Int].self, forKey: .genreIDS) ?? []
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? .zero
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? .empty
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? .zero
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? .empty
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? .empty
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? .empty
        self.votesAverage = try container.decodeIfPresent(Double.self, forKey: .votesAverage) ?? .zero
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount) ?? .zero
    }
    
}

extension MovieModel{
    
    static let example = MovieModel(genres: ["Adventure", "Adventure", "Adventure", "Adventure"], id: 1, popularity: "8.5", posterPath: "/3CxUndGhUcZdt1Zggjdb2HkLLQX.jpg", releaseYear: "2022", title: "Ant-Man and the Wasp: Quantumania", votesAverage: "8.2", votesCount: "859", overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler. In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler. In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler. In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler. In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler")

}
