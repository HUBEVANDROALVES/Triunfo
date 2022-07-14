//
//  NowPlayinfCollectionViewCell.swift
//  AlumiADA
//
//  Created by hubevandro on 11/07/22.
//

import UIKit

class NowPlayinfCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageViem: UIImageView!
    
    
    func setup (title: String, year: String, image: UIImage){
                
    titleLabel.text = title
    dateLabel.text = year
    imageViem.image = image
    }
}





