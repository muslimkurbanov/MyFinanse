//
//  MyExpensesAssembly.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

final class MyExpensesAssembly {
    
    static func assembleModule() -> UIViewController {
        
        guard let view = UIStoryboard(name: "MyExpensesScreen", bundle: nil).instantiateViewController(withIdentifier: "MyExpensesVC") as? MyExpensesVC else { return UIViewController() }
        
        let router = MyExpensesRouter(controller: view)
        let dataConverter = MyExpensesDataConverter()
        let presenter = MyExpensesPresenter(view: view, router: router, dataConverter: dataConverter)
        let tableViewManager = MyExpensesTableViewManager()
        
        tableViewManager.delegate = presenter
        view.tableViewManager = tableViewManager
        view.presenter = presenter
        
        return view
    }
}
