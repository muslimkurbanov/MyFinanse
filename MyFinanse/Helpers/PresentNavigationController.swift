//
//  PresentNavigationController.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 29.11.2021.
//

import UIKit

final class PresentNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }
}
