//
//  CustomTabBarController.swift
//  Fawry
//
//  Created by Elser_10 on 8/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeController = HomeViewController()
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.image = UIImage(systemName: "house.fill")
        tabBar.tintColor = UIColor(red: 2/255, green: 92/255, blue: 140/255, alpha: 1)
        
        let navHomeController = UINavigationController(rootViewController: homeController)
        let navEventsController = createTabBarController(title: "Events", image: #imageLiteral(resourceName: "events"))
        let navTicketsController = createTabBarController(title: "My Tickets", image: #imageLiteral(resourceName: "tickets"))
        let navProfileController = createTabBarController(title: "Profile", image: #imageLiteral(resourceName: "profile"))
        
        viewControllers = [navHomeController, navEventsController, navTicketsController, navProfileController]
    }
    
    func createTabBarController(title: String, image: UIImage?) -> UINavigationController {
        let viewController = UIViewController()
        view.backgroundColor = .orange
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
         let navBarController = UINavigationController(rootViewController: viewController)
        return navBarController
    }
}
