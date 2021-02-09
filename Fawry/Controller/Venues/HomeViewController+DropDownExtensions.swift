//
//  HomeViewController+DropDownExtensions.swift
//  Fawry
//
//  Created by Elser_10 on 8/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setupDropDownButton() {
        
        let btn = DropDownButton()
        btn.setTitle("Venues", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir Book", size: 18)
        btn.tintColor = .black
        
        btn.setImage( #imageLiteral(resourceName: "down_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.4)
        
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -70, bottom: 0, right: 0)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        
        btn.imageView?.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: venueLabel.bottomAnchor),
            btn.leftAnchor.constraint(equalTo: venueLabel.leftAnchor),
            btn.widthAnchor.constraint(equalToConstant: 100),
            btn.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
