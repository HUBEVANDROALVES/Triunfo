//
//  DetaillsViewController.swift
//  AlumiADA
//
//  Created by hubevandro on 13/07/22.
//

import UIKit

class DetaillsViewController: UIViewController {
    
    var  movie: Movie?

    @IBOutlet var backdroopImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
     //   print(movie)
        
        guard let movie = movie else {
            return
        }

        self.title = movie.title
        backdroopImage.image = UIImage(named: movie.backdrop)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.poster)
        ratingLabel.text = "Rating \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
    }
    

   
}
