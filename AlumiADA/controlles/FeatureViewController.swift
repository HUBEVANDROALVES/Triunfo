//
//  FeatureViewController.swift
//  AlumiADA
//
//  Created by hubevandro on 05/07/22.
//

import UIKit

class FeatureViewController: UIViewController { //} UICollectionViewDataSource {
    
    var  popularMovies : [Movie] = []        // =popularMovies()
    var upcomingMovies : [Movie] = []
    var  nowPlayingMovies : [Movie] = []
    
    @IBOutlet var nowplayngCollectionview: UICollectionView!
    @IBOutlet var popularCollectionview: UICollectionView!
   @IBOutlet var upcomingCollectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionview.dataSource = self
        nowplayngCollectionview.dataSource = self
        upcomingCollectionview.dataSource = self
        
        popularCollectionview.delegate = self
        nowplayngCollectionview.delegate = self
        upcomingCollectionview.delegate = self
        
        Task {
        
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionview.reloadData()
            
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionview.reloadData()
            
            self.nowPlayingMovies = await Movie.nowplayingMoviesAPI()
            self.nowplayngCollectionview.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
        if let destination = segue.destination as? DetaillsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        
        }
    }
}

