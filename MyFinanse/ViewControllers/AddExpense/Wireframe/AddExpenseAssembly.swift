//
//  AddExpenseAssembly.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 26.11.2021.
//

import Foundation
import UIKit

final class AddExpenseAssembly {
    
    static func assembleModule(delegate: MyExpensesPresenter) -> UIViewController {
        
        guard let view = UIStoryboard(name: "AddExpenseScreen", bundle: nil).instantiateViewController(withIdentifier: "AddExpenseVC") as? AddExpenseVC else { return UIViewController() }
        
        let router = AddExpenseRouter(controller: view)
        let presenter = AddExpensePresenter(view: view, router: router)
        
        view.presenter = presenter
        view.delegate = delegate
        
        return view
    }
}
