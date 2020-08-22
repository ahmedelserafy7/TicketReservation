//
//  DropDownView.swift
//  Fawry
//
//  Created by Elser_10 on 8/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        items = ["Venue1", "Venue2", "Venue3", "Venue4", "Venue5"]
        setupViews()
    }
    
    var delegate: DropDownDelegate?
    var tableView = UITableView()
    let cellId = "cellId"
    func setupViews() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    var items = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        
        cell.textLabel?.highlightedTextColor = .white
        cell.textLabel?.font = UIFont(name: "Avenir Book", size: 18)
        
        let blackBackgroundView = UIView()
        blackBackgroundView.backgroundColor = .black
        cell.selectedBackgroundView = blackBackgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.setButtonTitle(by: items[indexPath.row])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
