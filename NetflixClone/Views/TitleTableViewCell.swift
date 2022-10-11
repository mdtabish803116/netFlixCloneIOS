//
//  TitleTableViewCell.swift
//  NetflixClone
//
//  Created by EKINCARE on 11/10/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
      static let identifier = "TitleTableViewCell"
    
    private let playButton : UIButton = {
         let button = UIButton()
         let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
         button.setImage(image, for: .normal)
        button.tintColor = .white
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
    }()
    
    private let titleLabel : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
             return label
    }()
    
    private let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
//         imageView.layer.borderWidth = 2
//        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
         applyConstraint()
    }
    
    func applyConstraint(){
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor , constant : 10),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            posterImageView.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor , constant : 15),
            titleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    
    public func configure(with model : TitleViewModel){
        
        let posterString = "https://image.tmdb.org/t/p/w500\(model.posterUrl)"
        posterImageView.download(from: posterString)
        titleLabel.text = model.titleName
         
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
