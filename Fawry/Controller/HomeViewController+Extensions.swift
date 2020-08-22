//
//  HomeViewControllerExtensions.swift
//  Fawry
//
//  Created by Elser_10 on 8/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupViews() {
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(venueLabel)
        venueLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112).isActive = true
        venueLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        view.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: venueLabel.topAnchor).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(timeButton)
        timeButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
        timeButton.leftAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -4).isActive = true
        timeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(dividerView)
        dividerView.topAnchor.constraint(equalTo: timeButton.bottomAnchor, constant: 4).isActive = true
        dividerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        dividerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(parterreLabel)
        parterreLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 12).isActive = true
        parterreLabel.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -4).isActive = true
        
        view.addSubview(baignoireLabel)
        baignoireLabel.topAnchor.constraint(equalTo: parterreLabel.topAnchor).isActive = true
        baignoireLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 4).isActive = true
        
        view.addSubview(stageButton)
        stageButton.topAnchor.constraint(equalTo: parterreLabel.bottomAnchor, constant: 4).isActive = true
        stageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stageButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        stageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(collectionView)
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 470).isActive = true
        
        view.addSubview(seperatorView)
        seperatorView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8).isActive = true
        seperatorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        seperatorView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(totalLabel)
        totalLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 8).isActive = true
        totalLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        view.addSubview(currencyLabel)
        currencyLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 8).isActive = true
        currencyLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        view.addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 8).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: currencyLabel.leftAnchor, constant: -6).isActive = true
        
        view.addSubview(checkOutButton)
        checkOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(tabBarController!.tabBar.frame.height + 4)).isActive = true
        checkOutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        checkOutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        checkOutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 470)
    }
}
