//
//  DropDownButton.swift
//  Fawry
//
//  Created by Elser_10 on 8/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

protocol DropDownDelegate {
    func setButtonTitle(by name: String)
}

class DropDownButton: UIButton, DropDownDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        dropView = DropDownView()
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setButtonTitle(by name: String) {
        self.setTitle(name, for: .normal)
        dismissDropDown()
    }
    
    func dismissDropDown() {
        handleCollapsed()
    }
    
    var height: NSLayoutConstraint?
    var dropView = DropDownView()
    func setupViews() {
        
        superview?.addSubview(dropView)
        superview?.bringSubviewToFront(dropView)
        
        dropView.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dropView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dropView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    override func didMoveToSuperview() {
        setupViews()
    }
    
    enum DropDownState {
        case collapsed, expanded
    }
    
    var isVisible = false
    var nextState: DropDownState {
        return isVisible ? .collapsed : .expanded
    }
    
    func checkTableViewHeight() {
        height?.constant = dropView.tableView.contentSize.height > 160 ? 160 : dropView.tableView.contentSize.height
    }
    
    func handleExpanded() {
        
        checkTableViewHeight()
        
        height?.isActive = false
        height?.constant = 160
        height?.isActive = true
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
            
            self.setImage( #imageLiteral(resourceName: "up_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
            
            self.dropView.layoutIfNeeded()
            self.dropView.center.y += self.dropView.frame.height / 2
            self.isVisible = !self.isVisible
        }, completion: nil)
    }
    
    func handleCollapsed() {
        
        height?.isActive = true
        height?.constant = 0
        height?.isActive = false
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseIn, animations: {
            
            self.setImage( #imageLiteral(resourceName: "down_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
            
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
            self.isVisible = !self.isVisible
        }, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch nextState {
        case .collapsed: handleCollapsed()
        case .expanded: handleExpanded()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
