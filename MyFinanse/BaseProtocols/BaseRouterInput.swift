//
//  BaseRouterInput.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

protocol BaseRouterInput: AnyObject {
    
    var controller: UIViewController? { get set }
    
    init()
    
    func popVC()
    func popToRootVC(animated: Bool)
}


// MARK: - Default implementation
extension BaseRouterInput {
    
    init(controller: UIViewController) {
        self.init()
        self.controller = controller
    }
    
    func popVC() {
        controller?.navigationController?.popViewController(animated: true)
    }
    
    func popToRootVC(animated: Bool) {
        controller?.navigationController?.popToRootViewController(animated: animated)
    }
}
