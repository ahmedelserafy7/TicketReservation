//
//  HomeCell.swift
//  Fawry
//
//  Created by Elser_10 on 8/16/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "wonder"))
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 3
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "I was wondering Is anyone supposed to look up my own cake?"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 19)
        label.numberOfLines = 0
        label.backgroundColor = UIColor(white: 0.1, alpha: 0.2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 340),
            imageView.heightAnchor.constraint(equalToConstant: 450)
        ])
        
        addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -64),
            subtitleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            subtitleLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
