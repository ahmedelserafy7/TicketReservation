//
//  CalenderPopUp.swift
//  Fawry
//
//  Created by Elser_10 on 8/19/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class CalendarPopUp: NSObject {
    
    let whiteCalenderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var datePicker: UIDatePicker = { [unowned self] in
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .dateAndTime
        picker.addTarget(self, action: #selector(handlePicker(sender:)), for: .valueChanged)
        return picker
    }()
    
    var dateString = ""
    @objc func handlePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/dd/yyyy h:mm a"
        dateString = dateFormatter.string(from: sender.date)
    }
    
    lazy var doneButton: UIButton = { [unowned self] in
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        button.setTitleColor(UIColor(red: 5/255, green: 130/255, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleDone() {
        homeController?.timeButton.setTitle(dateString, for: .normal)
        handleDismiss()
    }
    
    lazy var cancelButton: UIButton = { [unowned self] in
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        button.setTitleColor(UIColor(red: 5/255, green: 130/255, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleCancel() {
        handleDismiss()
    }
    
    let blackView = UIView()
    var homeController: HomeViewController?
    func showCalendar() {
        guard let window = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first else { return }
        blackView.frame = window.frame
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        window.addSubview(blackView)
        
        blackView.alpha = 0
        self.setupViews()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.whiteCalenderView.alpha = 1
            self.homeController?.timeButton.setImage( #imageLiteral(resourceName: "up_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        }, completion: nil)
    }
    
    func setupViews() {
        guard let window = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first else { return }
        window.addSubview(whiteCalenderView)
        
        NSLayoutConstraint.activate([
            whiteCalenderView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            whiteCalenderView.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            whiteCalenderView.widthAnchor.constraint(equalToConstant: 340),
            whiteCalenderView.heightAnchor.constraint(equalToConstant: 340)
        ])
        
        whiteCalenderView.addSubview(datePicker)
        datePicker.topAnchor.constraint(equalTo: whiteCalenderView.topAnchor).isActive = true
        datePicker.leftAnchor.constraint(equalTo: whiteCalenderView.leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: whiteCalenderView.rightAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        whiteCalenderView.addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: -10).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: whiteCalenderView.centerXAnchor, constant: -85).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteCalenderView.addSubview(doneButton)
        doneButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: -10).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: whiteCalenderView.rightAnchor, constant: -85).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleDismiss() {
        blackView.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            self.whiteCalenderView.alpha = 0
            self.homeController?.timeButton.setImage( #imageLiteral(resourceName: "down_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        }, completion: nil)
    }
    
    override init() {}
}
