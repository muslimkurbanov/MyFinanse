//
//  MainTabBarController.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        tabBar.tintColor = .white
        
        viewControllers = [MyExpensesNC()]
        viewControllers?[0].tabBarItem = UITabBarItem(title: "Расходы",
                                                      image: UIImage(systemName: "doc.plaintext"), selectedImage: nil)
    }
}
