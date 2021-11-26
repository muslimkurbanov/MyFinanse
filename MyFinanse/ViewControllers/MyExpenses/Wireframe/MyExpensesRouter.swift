//
//  MyExpensesRouter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

protocol MyExpensesRouterInput: BaseRouterInput {
    
    func showAddExpenseScreen()
    func showExpensesDateScreen()
    func showSetupExpensesScreen()
}

final class MyExpensesRouter {
    
    //MARK: - Properties
    
    weak var controller: UIViewController?
}

//MARK: - MyExpensesRouterInput

extension MyExpensesRouter: MyExpensesRouterInput {
    
    func showAddExpenseScreen() {
        
        let addExpenseVC = AddExpenseAssembly.assembleModule()
        
        controller?.navigationController?.present(UINavigationController(rootViewController: addExpenseVC), animated: true)
    }
    
    func showSetupExpensesScreen() {
        
        let setupExpensesVC = SetupExpensesAssembly.assembleModule()
        
        controller?.navigationController?.present(UINavigationController(rootViewController: setupExpensesVC), animated: true)
    }
    
    func showExpensesDateScreen() {
        
        let vc = UIStoryboard(name: "ExpensesDateScreen", bundle: nil).instantiateViewController(withIdentifier: "ExpensesDateVC")
        
//        controller?.present(vc, animated: true, completion: nil)
        controller?.navigationController?.present(vc, animated: true, completion: nil)
    }
}
