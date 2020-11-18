//
//  ViewController.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var mainActivityIndicator: UIActivityIndicatorView!
    
    //Variables
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupOutlets()
        fetchMovies()
    }
    
    func setupOutlets() {
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.isHidden = true
    }
    
    func showErrorView() {
        //Show error view here
    }
    
    func fetchMovies() {
        
        Networking.shared.fetchPopularMovies { (result) in
            switch result {
            case .failure(let err):
                self.showErrorView()
                print(err)
                
            case .success(let movies):
                self.stopActivityIndicator()
                self.movies = movies
                self.reloadTableView()
            }
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            self.mainActivityIndicator.stopAnimating()
            self.mainTableView.isHidden = false
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainTableViewCell
        let currentMovie = self.movies[indexPath.row]
        
        cell.setCell(movie: currentMovie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //go to detail view
        let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController
        vc?.movie = self.movies[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
