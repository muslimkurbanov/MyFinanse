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
        
        viewControllers = [MyExpensesNC()]
        viewControllers?[0].tabBarItem = UITabBarItem(title: "Расходы",
                                                      image: UIImage(systemName: "doc.plaintext"), selectedImage: nil)
    }
}
