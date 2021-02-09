//
//  HomeViewController+NavBarExtensions.swift
//  Fawry
//
//  Created by Elser_10 on 8/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setupNavBar() {
        
        navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        view.addSubview(navBar)
        
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        navBar.addSubview(textView)
        textView.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 32).isActive = true
        textView.leftAnchor.constraint(equalTo: navBar.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: navBar.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        
        let date = Date()
        let dateFormatter = DateFormatter()
    
        dateFormatter.dateFormat = "dd LLLL"
        let day = dateFormatter.string(from: date)
        
        let attributedText = NSMutableAttributedString(string: "Festival | \(day) | cairoOperaHouse", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Avenir Book", size: 15) ?? ""])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        dateFormatter.dateFormat = "LLLL"
        let currentMonth = dateFormatter.string(from: date)
        
        attributedText.append(NSAttributedString(string: "\ngoogle event for \(currentMonth)", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir Book", size: 20) ?? ""]))
        
        let range = NSMakeRange(0, attributedText.string.count)
        paragraphStyle.alignment = .center
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        
        textView.attributedText = attributedText
        
        textView.addSubview(backArrowButton)
        backArrowButton.centerYAnchor.constraint(equalTo: textView.centerYAnchor, constant: 10).isActive = true
        backArrowButton.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 24).isActive = true
        backArrowButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        backArrowButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        navBar.addSubview(navBarSeperatorView)
        navBarSeperatorView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        navBarSeperatorView.leftAnchor.constraint(equalTo: navBar.leftAnchor).isActive = true
        navBarSeperatorView.rightAnchor.constraint(equalTo: navBar.rightAnchor).isActive = true
        navBarSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
