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
    
    func fetchMoveCasting(movieId: Int, completion: @escaping (Result<[Cast], Error>) -> ()) {
        
        let apiString = API.API_MOVIE_CASTING.replaceWithMyApiKey()
        let urlString = apiString.replaceMovieId(movieId: movieId)
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                let casting = response.casting
                completion(.success(casting!))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        
        }.resume()
    }
}
