//
//  MyExpensesRouter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

protocol MyExpensesRouterInput: BaseRouterInput {
    
    func showExpensesDateScreen()
    func showSetupExpensesScreen()
}

final class MyExpensesRouter {
    
    //MARK: - Properties
    
    weak var controller: UIViewController?
}

//MARK: - MyExpensesRouterInput

extension MyExpensesRouter: MyExpensesRouterInput {
    
    func showSetupExpensesScreen() {
        
        let setupExpensesVC = SetupExpensesAssembly.assembleModule()
        
        controller?.navigationController?.present(setupExpensesVC, animated: true, completion: nil)
    }
    
    func showExpensesDateScreen() {
        
        let vc = UIStoryboard(name: "ExpensesDateScreen", bundle: nil).instantiateViewController(withIdentifier: "ExpensesDateVC")
        
//        controller?.present(vc, animated: true, completion: nil)
        controller?.navigationController?.present(vc, animated: true, completion: nil)
    }
}
