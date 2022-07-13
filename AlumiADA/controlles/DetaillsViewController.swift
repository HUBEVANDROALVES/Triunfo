//
//  DetaillsViewController.swift
//  AlumiADA
//
//  Created by hubevandro on 13/07/22.
//

import UIKit

class DetaillsViewController: UIViewController {
    
    var  movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(movie)
        self.title = movie?.title
    }
    

   
}
