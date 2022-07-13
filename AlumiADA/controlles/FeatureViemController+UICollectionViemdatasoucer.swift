//
//  FeatureViemController+UICollectionViemdatasoucer.swift
//  AlumiADA
//
//  Created by hubevandro on 12/07/22.
//

import UIKit
extension FeatureViewController
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionview {
            return popularMovies.count
        } else if collectionView == nowplayngCollectionview {
            return nowPlayingMovies.count
        } else {
            return 0
        }
    }
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell  = popularCollectionview.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for:indexPath) as? PopularCollectionViewCell
        {
            cell.titleLabel.text = popularMovies[indexPath.item].title
            cell.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = nowplayngCollectionview.dequeueReusableCell(withReuseIdentifier:NowPlayinfCollectionViewCell.cellIdentifier, for:indexPath)               as? NowPlayinfCollectionViewCell {
            let extractedExpr: String = nowPlayingMovies[indexPath.item].title
            cell.titleLabel.text = extractedExpr
            cell.dateLabel.text = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
           // cell.dateLabel.text = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
            cell.imageViem.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionview {
            return makePopularCell(indexPath)
            
        }
        else if collectionView == nowplayngCollectionview {
            return makeNowPlayingCell(indexPath)
            
            
                
            
        }
        return UICollectionViewCell()
    }
}

