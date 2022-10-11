//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by EKINCARE on 10/10/22.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView : UIImageView = {
          let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
          return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with posterPath : String){
        
        let posterUrl =  "https://image.tmdb.org/t/p/w500\(posterPath)" 
        
        posterImageView.download(from: posterUrl)
    }
    
}
