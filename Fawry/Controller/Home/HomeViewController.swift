//
//  ViewController.swift
//  Fawry
//
//  Created by Elser_10 on 8/11/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let backArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let navBarSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let venueLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Venue"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Book", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Time"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Book", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timeButton: UIButton = { [unowned self] in
        let button = UIButton()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/dd/yyyy h:mm a"
        let currentDate = dateFormatter.string(from: date)
        button.setTitle(currentDate, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Book", size: 18)
        button.setTitleColor(.black, for: .normal)
        
        button.setImage(#imageLiteral(resourceName: "down_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.imageView?.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -66, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 170, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(handleDatePicker), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var calendarPopUp: CalendarPopUp = { [unowned self] in
        let calendar = CalendarPopUp()
        calendar.homeController = self
        return calendar
    }()
    
    @objc func handleDatePicker() {
        calendarPopUp.showCalendar()
    }
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parterreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 249/255, green: 225/255, blue: 231/255, alpha: 1)
        label.text = "PARTEERE"
        label.font = UIFont(name: "Avenir Book", size: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let baignoireLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 171/255, green: 237/255, blue: 224/255, alpha: 1)
        label.text = "BIAGNOIRE"
        label.font = UIFont(name: "Avenir Book", size: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Stage", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Book", size: 14)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "EGP"
        label.textColor = UIColor(red: 192/255, green: 195/255, blue: 192/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "00.00"
        label.textColor = UIColor(red: 0, green: 124/255, blue: 148/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Checkout with", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 124/255, blue: 148/255, alpha: 1), for: .normal)
        button.setImage(#imageLiteral(resourceName: "fawry").withRenderingMode(.alwaysOriginal), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/250, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.semanticContentAttribute = .forceRightToLeft
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cellId = "cellId"
    var navBar: UINavigationBar = UINavigationBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupNavBar()
        setupDropDownButton()
    }
}

extension HomeViewController: HomeDelegate {
    func setTitle(name: String) {
        priceLabel.text = name
    }
}
