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
    var casting = [Cast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupOutlets()
        self.fetchCasting()
        self.calculateStarCount()
        print(ratingStars!)
    }
    
    func setupOutlets() {
        
        self.movieTitle.text = movie?.title
        self.movieOverview.text = movie?.overview
        self.movieRating.text = String(format: "%.2f", ceil(movie?.rating ?? Double.zero))
        self.movieImage.loadImageWithUrlString(string: API.API_FETCH_IMAGE + (movie?.backdropPath ?? ""))
        self.roundedBackgroundView.layer.cornerRadius = 40
        
        self.castingCollectionView.delegate = self
        self.castingCollectionView.dataSource = self
    }
    
    func fetchCasting() {
        
        Networking.shared.fetchMoveCasting(movieId: self.movie?.id ?? 0) { (result) in
            switch result {
            case .failure(let err):
                self.castingCollectionView.removeFromSuperview()
                print(err)

            case .success(let casting):
                self.casting = casting
                print(casting)
                self.reloadCollection()
            }
        }
    }
    
    func calculateStarCount() {
        
        let newRating = Int(self.movie?.rating ?? 0) / 2
        
        for i in 0...newRating {
            ratingStars[i].image = UIImage(systemName: "star.fill")
        }
    }
    
    func reloadCollection() {
        DispatchQueue.main.async {
            self.castingCollectionView.reloadData()
        }
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.casting.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = castingCollectionView.dequeueReusableCell(withReuseIdentifier: "castingCell", for: indexPath) as! CastingCollectionViewCell
        
        cell.setCell(cast: casting[indexPath.row])
        
        return cell
    }
}
