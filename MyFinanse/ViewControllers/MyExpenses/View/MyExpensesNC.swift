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
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        navigationBar.tintColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        
        viewControllers = [myExpensesScreen]
    }
}
