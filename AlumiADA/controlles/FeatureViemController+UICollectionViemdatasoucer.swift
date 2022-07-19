//
//  FeatureViemController+UICollectionViemdatasoucer.swift
//  AlumiADA
//
//  Created by hubevandro on 12/07/22.
//

import UIKit
extension FeatureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionview {
            return popularMovies.count
        } else if collectionView == nowplayngCollectionview {
            return nowPlayingMovies.count
        }else if collectionView == upcomingCollectionview {
            return upcomingMovies.count
            
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionview {
            return makePopularCell(indexPath)
        } else if collectionView == nowplayngCollectionview {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == upcomingCollectionview {
            return makeUpcomingcell(indexPath)
        }
        
        return UICollectionViewCell()
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell{
        if let cell  = popularCollectionview.dequeueReusableCell(withReuseIdentifier:
                                                                    PopularCollectionViewCell.cellIdentifier, for:indexPath) as? PopularCollectionViewCell{
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage())
            let movie = popularMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(wintPath: movie.backdropPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell.setup(title: movie.title, image: imagem)
            }
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = nowplayngCollectionview.dequeueReusableCell(withReuseIdentifier:NowPlayinfCollectionViewCell.cellIdentifier, for:indexPath)  as? NowPlayinfCollectionViewCell
        {
            let movie : Movie = nowPlayingMovies[indexPath.item]
            
            
            cell.setup(title: movie.title,
                       year: "\(movie.releaseDate.prefix(4))",
                       image: UIImage()
            )
            
            Task {
                let imageData = await Movie.downloadImageData(wintPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell.setup(title: movie.title,
                           year: "\(movie.releaseDate.prefix(4))",
                           image: imagem)
            }
            
            return cell
        }
        return NowPlayinfCollectionViewCell()
    }
    
    fileprivate func makeUpcomingcell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = upcomingCollectionview.dequeueReusableCell(withReuseIdentifier:UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        {
            let movie  : Movie = upcomingMovies[indexPath.item]
            
            cell.setup (title: movie.title,
                        year: "\(movie.releaseDate.prefix(4))",
                        image: UIImage()
            )
            
            
            Task {
                let imageData = await Movie.downloadImageData(wintPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title,
                           year: "\(movie.releaseDate.prefix(4))",
                           image: imagem)
            }
            return cell
            
        }
        return UpcomingCollectionViewCell()
        
    }
}



