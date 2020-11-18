//
//  Response.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation

struct Response: Decodable {
    
    var movies: [Movie]?
    var casting: [Cast]?
    
    private enum CodingKeys: String, CodingKey{
        case movies = "results"
        case casting = "cast"
    }
    
}
