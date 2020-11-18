//
//  DetailViewController.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
//    Outlets
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet var ratingStars: [UIImageView]!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var roundedBackgroundView: UIView!
    @IBOutlet weak var castingCollectionView: UICollectionView!
    
    //Variables
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    func setupOutlets() {
        
        self.movieTitle.text = movie?.title
        self.movieOverview.text = movie?.overview
        self.movieRating.text = String(format: "%.2f", ceil(movie?.rating ?? Double.zero))
        self.movieImage.loadImageWithUrlString(string: API.API_FETCH_IMAGE + (movie?.backdropPath ?? ""))
        self.roundedBackgroundView.layer.cornerRadius = 40
    }
    
    func calculateStarCount() {
    }
}
