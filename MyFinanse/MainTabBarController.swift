//
//  MainTabBarController.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 15.0, *) {
            
           let appearance = UITabBarAppearance()
           appearance.configureWithOpaqueBackground()
           appearance.backgroundColor = UIColor(named: "mainAppColor")
           
           tabBar.standardAppearance = appearance
           tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor(named: "mainAppColor")
        tabBar.tintColor = .white
        
        viewControllers = [MyExpensesNC()]
        viewControllers?[0].tabBarItem = UITabBarItem(title: "Расходы",
                                                      image: UIImage(systemName: "doc.plaintext"), selectedImage: nil)
    }
}
