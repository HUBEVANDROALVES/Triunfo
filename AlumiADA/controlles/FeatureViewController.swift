//
//  FeatureViewController.swift
//  AlumiADA
//
//  Created by hubevandro on 05/07/22.
//

import UIKit

class FeatureViewController: UIViewController, UICollectionViewDataSource {
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    
    @IBOutlet var nowplayngCollectionview: UICollectionView!
    @IBOutlet var popularCollectionview: UICollectionView!
    @IBOutlet var upcomingCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionview.dataSource = self
        nowplayngCollectionview.dataSource = self
        
        popularCollectionview.delegate = self
        nowplayngCollectionview.delegate = self            
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let destination = segue.destination as? DetaillsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        
        }
    }
}

