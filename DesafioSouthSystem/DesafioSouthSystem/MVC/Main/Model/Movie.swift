//
//  Movie.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation

struct Movie: Decodable{
    
    var id: Int?
    var title: String?
    var rating: Double?
    var overview: String?
    var posterPath: String?
    var genres: [Genre]?
    
    var imageURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")
    }
    
    private enum CodingKeys: String, CodingKey {
        case title, id, overview
        case rating = "vote_average"
        case posterPath = "poster_path"
    }
}
