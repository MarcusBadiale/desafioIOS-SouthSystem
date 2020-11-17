//
//  Genre.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation

struct Genre: Codable{
    
    var id: Int?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name
    }
}
