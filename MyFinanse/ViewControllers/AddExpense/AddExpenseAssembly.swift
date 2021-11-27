//
//  AddExpenseAssembly.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 26.11.2021.
//

import Foundation
import UIKit

final class AddExpenseAssembly {
    
    static func assembleModule() -> UIViewController {
        
        guard let view = UIStoryboard(name: "AddExpenseScreen", bundle: nil).instantiateViewController(withIdentifier: "AddExpenseVC") as? AddExpenseVC else { return UIViewController() }
        
        let presenter = AddExpensePresenter(view: view)
        view.presenter = presenter
        
        return view
    }
}
