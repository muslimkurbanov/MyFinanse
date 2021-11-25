//
//  SetupExpensesAssembly.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 12.11.2021.
//

import UIKit

final class SetupExpensesAssembly {
    
    static func assembleModule() -> UIViewController {
        
        guard let view = UIStoryboard(name: "SetupExpensesScreen", bundle: nil).instantiateViewController(withIdentifier: "SetupExpensesVC") as? SetupExpensesVC else { return UITableViewController() }
        
        return view
    }
}
