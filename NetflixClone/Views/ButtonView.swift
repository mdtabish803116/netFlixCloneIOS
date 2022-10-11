//
//  ButtonView.swift
//  NetflixClone
//
//  Created by EKINCARE on 07/10/22.
//

import UIKit

struct ButtonViewConstant {
    static let width: CGFloat = 350
    static let height: CGFloat = 150
    static let bottomMargin:CGFloat = height + 40
}

struct Button {
    static let height: CGFloat = 40
}

class ButtonView: UIView {
    
    private let playButton: UIButton = {
         let button = UIButton()
        button.setTitle("Play" , for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
      //  button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download" , for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
//        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .red
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstriant()
        
    }
    
    
    private func applyConstriant(){
        playButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            playButton.heightAnchor.constraint(equalToConstant: Button.height),
            playButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            playButton.widthAnchor.constraint(equalTo: downloadButton.widthAnchor),
            playButton.rightAnchor.constraint(equalTo: downloadButton.leftAnchor , constant: -30),

        ])
        
        NSLayoutConstraint.activate([
            downloadButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            downloadButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            downloadButton.heightAnchor.constraint(equalTo: playButton.heightAnchor),
            downloadButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            downloadButton.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
   
}
