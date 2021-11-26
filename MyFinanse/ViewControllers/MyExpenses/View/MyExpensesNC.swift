//
//  MyExpensesNC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 08.11.2021.
//

import UIKit

final class MyExpensesNC: UINavigationController {
    
    override func viewDidLoad() {
        
        let myExpensesScreen = MyExpensesAssembly.assembleModule()
        
        if #available(iOS 15.0, *) {
            
            navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBar.standardAppearance.shadowColor = nil
            navigationBar.standardAppearance.backgroundColor = UIColor(named: "mainAppColor")
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
            navigationBar.tintColor = .white
        }
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor(named: "mainAppColor")
        navigationBar.tintColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        
        viewControllers = [myExpensesScreen]
    }
}
