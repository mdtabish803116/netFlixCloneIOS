//
//  HeroHeaderView.swift
//  NetflixClone
//
//  Created by EKINCARE on 07/10/22.
//

import UIKit

class HeroHeaderView: UIView {
    
    let gradientLayer = CAGradientLayer()
    let buttonView = ButtonView()
    
    private let heroImageView: UIImageView = {
          let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    
    func addGradient(){
        
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
//        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
    }
    
    func addButtonView(){
        self.addSubview(buttonView)
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addButtonView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
        gradientLayer.frame = bounds
        buttonView.frame = CGRect.init(x: (self.frame.size.width-ButtonViewConstant.width)/2, y:self.frame.size.height - ButtonViewConstant.bottomMargin, width: ButtonViewConstant.width, height: ButtonViewConstant.height)
        
    }
    
}
