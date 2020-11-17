//
//  Networking.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation

class Networking {
    
    static let shared = Networking()
    
    func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> ()) {
        
        let urlString = API.API_POPULAR_MOVIES.replaceWithMyApiKey()
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                let movies = response.movies
                completion(.success(movies!))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        
        }.resume()
    }
}
