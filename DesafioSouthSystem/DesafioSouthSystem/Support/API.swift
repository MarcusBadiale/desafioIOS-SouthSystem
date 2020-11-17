//
//  API.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation

class API {
    
    static let MY_API_KEY = "4c86680eeadb3c625a7f347b2ce6e135"
    static let API_POPULAR_MOVIES = "https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1"
    static let API_FETCH_IMAGE = "https://image.tmdb.org/t/p/w500/"
}

extension String {
    
    func replaceWithMyApiKey() -> String {
        return self.replacingOccurrences(of: "<<api_key>>", with: API.MY_API_KEY)
    }
}
