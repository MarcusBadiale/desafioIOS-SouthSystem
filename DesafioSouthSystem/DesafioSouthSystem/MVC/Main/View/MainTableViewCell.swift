//
//  MainTableViewCell.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    func setCell(movie: Movie) {
        self.movieImage.layer.cornerRadius = 15
        
        self.movieName.text = movie.title
        self.movieDescription.text = movie.overview
        self.movieRating.text = String(format: "%.2f", ceil(movie.rating ?? Double.zero))
        self.movieImage.loadImageWithUrlString(string: API.API_FETCH_IMAGE + (movie.posterPath ?? ""))
    }
}
