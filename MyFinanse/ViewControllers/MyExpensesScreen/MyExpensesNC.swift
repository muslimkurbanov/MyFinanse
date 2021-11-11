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
        
        viewControllers = [myExpensesScreen]
    }
}
