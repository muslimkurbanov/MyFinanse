//
//  SetupExpensesVC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 12.11.2021.
//

import UIKit

protocol SetupExpensesViewInput: AnyObject {
    
}

final class SetupExpensesVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var presenter: SetupExpensesViewOutput?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewIsReady()
    }
}

//MARK: - ViewInput

extension SetupExpensesVC: SetupExpensesViewInput {
    
}
