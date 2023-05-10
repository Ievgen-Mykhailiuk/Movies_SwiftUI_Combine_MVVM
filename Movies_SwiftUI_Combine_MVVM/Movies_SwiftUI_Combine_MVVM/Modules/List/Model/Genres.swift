//
//  Genres.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import Foundation

struct GenresData: Codable {
    
    let genres: [GenreModel]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.genres = try container.decodeIfPresent([GenreModel].self, forKey: .genres) ?? []
    }
    
}

struct GenreModel: Codable {
    
    let id: Int
    let name: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? .zero
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? .empty
    }
    
}
