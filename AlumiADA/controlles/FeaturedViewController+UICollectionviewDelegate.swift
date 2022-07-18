//
//  FeaturedViewController+UICollectionviewDelegate.swift
//  AlumiADA
//
//  Created by hubevandro on 13/07/22.
//
 
import UIKit

extension FeatureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let movie: Movie
        
        
        if collectionView == popularCollectionview {
                   //   print (popularMovies[indexPath.item])
            movie = popularMovies[indexPath.item]
        } else {
                 //      print(nowPlayingMovies[indexPath.item])
            movie = nowPlayingMovies[indexPath.item]
            }
        self.performSegue(withIdentifier: "DetaillsSegue", sender: movie)
    }
    
}

