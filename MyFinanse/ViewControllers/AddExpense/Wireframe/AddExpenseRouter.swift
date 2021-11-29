//
//  AddExpenseRouter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 29.11.2021.
//

import UIKit

protocol AddExpenseRouterInput: BaseRouterInput {
    
    func showExpenseImageScreen(delegate: AddExpenseVC)
}

final class AddExpenseRouter {
    
    weak var controller: UIViewController?
}

extension AddExpenseRouter: AddExpenseRouterInput {
    
    func showExpenseImageScreen(delegate: AddExpenseVC) {
        
        guard let imageVC = UIStoryboard(name: "AddExpenseScreen", bundle: nil).instantiateViewController(withIdentifier: "AddExpenseImageVC") as? AddExpenseImageVC else { return }
        
        imageVC.delegate = delegate
        
        controller?.navigationController?.present(PresentNavigationController(rootViewController: imageVC), animated: true, completion: nil)
    }
}
