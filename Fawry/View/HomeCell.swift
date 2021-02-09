//
//  HomeCell.swift
//  Fawry
//
//  Created by Elser_10 on 8/16/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

protocol HomeDelegate {
    func setTitle(name: String)
}

class HomeCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var button: UIButton! {
        didSet {
            button.addTarget(self, action: #selector(handleCurrency(sender:)), for: .touchUpInside)
        }
    }
    
    var isClicked = true
    @objc func handleCurrency(sender: UIButton) {
        
        if sender.currentTitleColor == UIColor(red: 108/255, green: 86/255, blue: 91/255, alpha: 1) {
            if isClicked {
                sender.backgroundColor = .red
                delegate?.setTitle(name: "90:00")
            } else {
                sender.backgroundColor = UIColor(red: 249/255, green: 225/255, blue: 231/255, alpha: 1)
                delegate?.setTitle(name: "00:00")
            }
            
            print("RED")
            
        } else {
            if isClicked {
                sender.backgroundColor = .green
                delegate?.setTitle(name: "75:00")
            } else {
                sender.backgroundColor = UIColor(red: 171/255, green: 237/255, blue: 224/255, alpha: 1)
                delegate?.setTitle(name: "00:00")
            }
            
            print("Green")
        }
        
        isClicked = !isClicked
    }
    
    var delegate: HomeDelegate?
    func setupViews() {
        
        let firstMargin: CGFloat = 16
        setupRedSection(xFactor: 35, yFactor: 0, secXFactor: 9, yMargin: firstMargin, numOfAliens: 12, threshold: 6)
        setupRedSection(xFactor: 50, yFactor: 1, secXFactor: -8, yMargin: firstMargin, numOfAliens: 12, threshold: 6)
        setupRedSection(xFactor: 30, yFactor: 2, secXFactor: 9, yMargin: firstMargin, numOfAliens: 14, threshold: 7)
        setupRedSection(xFactor: 22, yFactor: 3, secXFactor: -3, yMargin: firstMargin, numOfAliens: 16, threshold: 8)
        setupRedSection(xFactor: 12, yFactor: 4, secXFactor: -20, yMargin: firstMargin, numOfAliens: 18, threshold: 9)
        setupRedSection(xFactor: 22, yFactor: 5, secXFactor: -8, yMargin: firstMargin, numOfAliens: 16, threshold: 8)
        setupRedSection(xFactor: 17, yFactor: 6, secXFactor: 3, yMargin: firstMargin, numOfAliens: 16, threshold: 8)
        
        let secondMargin: CGFloat = 40
        setupRedSection(xFactor: 17, yFactor: 7, secXFactor: 3, yMargin: secondMargin, numOfAliens: 16, threshold: 8)
        setupRedSection(xFactor: 22, yFactor: 8, secXFactor: -8, yMargin: secondMargin, numOfAliens: 16, threshold: 8)
        setupRedSection(xFactor: 12, yFactor: 9, secXFactor: -20, yMargin: secondMargin, numOfAliens: 18, threshold: 9)
        setupRedSection(xFactor: 22, yFactor: 10, secXFactor: -8, yMargin: secondMargin, numOfAliens: 16, threshold: 8)
        setupRedSection(xFactor: 12, yFactor: 11, secXFactor: -20, yMargin: secondMargin, numOfAliens: 18, threshold: 9)
        setupRedSection(xFactor: 22, yFactor: 12, secXFactor: -8, yMargin: secondMargin, numOfAliens: 16, threshold: 8)
        setupRedSection(xFactor: 30, yFactor: 13, secXFactor: 9, yMargin: secondMargin, numOfAliens: 14, threshold: 7)
        setupRedSection(xFactor: 105, yFactor: 14, secXFactor: -8, yMargin: secondMargin, numOfAliens: 6, threshold: 3)
        setupRedSection(xFactor: 80, yFactor: 15, secXFactor: 9, yMargin: secondMargin, numOfAliens: 8, threshold: 4)
        
        setupFirstGreenColumn()
        setupSecondGreenColumn()
        setupGreenHorizontalLineBar()
    }
    
    let redButtonWidth: CGFloat = 12
    let greenButtonWidth: CGFloat = 14
    
    func setupRedSection(xFactor: CGFloat, yFactor: CGFloat, secXFactor: CGFloat, yMargin: CGFloat, numOfAliens: Int, threshold: Int) {
        
        let space: CGFloat = 4
        let emptySpace: CGFloat = 30
        
        var xAxis = (emptySpace / 2) + xFactor
        var yAxis: CGFloat = yMargin + (yFactor * redButtonWidth) + (8 * yFactor)
        
        for i in 1...numOfAliens {
            
            setupRedButton(xAxis, yAxis)
            
            xAxis += space + redButtonWidth
            
            if i % threshold == 0 {
                xAxis += redButtonWidth + (emptySpace / 2) + secXFactor
                yAxis = yMargin + (yFactor * redButtonWidth) + (8 * yFactor)
            }
        }
    }
    
    func setupRedButton(_ xAxis: CGFloat, _ yAxis: CGFloat) {
        
        button = UIButton(type: .system)
        button.frame = CGRect(x: xAxis, y: yAxis, width: redButtonWidth, height: redButtonWidth)
        
        button.backgroundColor = UIColor(red: 249/255, green: 225/255, blue: 231/255, alpha: 1)
        
        button.setTitle("..", for: .normal)
        button.setTitleColor(UIColor(red: 108/255, green: 86/255, blue: 91/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = redButtonWidth / 2
        button.clipsToBounds = true
        button.titleEdgeInsets = UIEdgeInsets(top: -8, left: 0, bottom: 0, right: 0)
        
        addSubview(button)
    }
    
    func setupFirstGreenColumn() {
        
        let space: CGFloat = 4
        
        var xAxis: CGFloat = 0
        var yAxis: CGFloat = 24 + greenButtonWidth + 8
        
        for i in 1...24 {
            
            setupGreenButton(xAxis, yAxis)
            
            yAxis += space + greenButtonWidth
            
            if i % 18 == 0 {
                xAxis = 0
                // increase yAxis with value of 16 above when getting in again
                yAxis += 16
            }
            
            if i % 19 == 0 {
                xAxis += ((greenButtonWidth / 2) + 4)
                yAxis -= 2
            }
            
            if i % 20 == 0 {
                xAxis += (greenButtonWidth)
                yAxis -= 2
            }
            
            if i % 21 == 0 {
                xAxis += 4 + greenButtonWidth
                yAxis -= ((greenButtonWidth / 2) + 4)
            }
            
            if i % 22 == 0 {
                xAxis += 2 + greenButtonWidth
                yAxis -= ((greenButtonWidth / 2) + 4)
            }
            
            if i % 23 == 0 {
                xAxis += 2 + greenButtonWidth
                yAxis -= ((greenButtonWidth / 2) + 4)
            }
        }
    }
    
    func setupSecondGreenColumn() {
        
        let space: CGFloat = 4
        
        var xAxis: CGFloat = 340 - 14
        var yAxis: CGFloat = 24 + greenButtonWidth + 8
        
        for i in 1...24 {
            
            setupGreenButton(xAxis, yAxis)
            
            yAxis += space + greenButtonWidth
            
            if i % 18 == 0 {
                xAxis = 340 - 14
                yAxis += 16
                
            }
            if i % 19 == 0 {
                xAxis -= ((greenButtonWidth / 2) + 4)
                yAxis -= 2
            }
            
            if i % 20 == 0 {
                xAxis -= (greenButtonWidth)
                yAxis -= 2
            }
            
            if i % 21 == 0 {
                xAxis -= 4 + greenButtonWidth
                yAxis -= ((greenButtonWidth / 2) + 4)
            }
            
            if i % 22 == 0 {
                xAxis -= 2 + greenButtonWidth
                yAxis -= ((greenButtonWidth / 2) + 4)
            }
            
            if i % 23 == 0 {
                xAxis -= 2 + greenButtonWidth
                yAxis -= ((greenButtonWidth / 2) + 4)
            }
        }
    }
    
    func setupGreenButton(_ xAxis: CGFloat, _ yAxis: CGFloat) {
        
        button = UIButton(type: .custom)
        button.frame = CGRect(x: xAxis, y: yAxis, width: greenButtonWidth, height: greenButtonWidth)
        
        button.backgroundColor = UIColor(red: 171/255, green: 237/255, blue: 224/255, alpha: 1)
        
        button.setTitle("...", for: .normal)
        button.setTitleColor(UIColor(red: 44/255, green: 129/255, blue: 115/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = greenButtonWidth / 2
        button.titleEdgeInsets = UIEdgeInsets(top: -7, left: 0, bottom: 0, right: 0)
        button.clipsToBounds = true
        
        addSubview(button)
    }
    
    func setupGreenHorizontalLineBar() {
        
        let space: CGFloat = 4
        
        var xAxis: CGFloat = 75 + 48
        let yAxis: CGFloat = 453
        
        for _ in 1...6 {
            
            setupGreenButton(xAxis, yAxis)
            
            xAxis += space + greenButtonWidth
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
