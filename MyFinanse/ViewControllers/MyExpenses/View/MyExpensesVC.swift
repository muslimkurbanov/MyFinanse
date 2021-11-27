//
//  MyExpensesVC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

protocol MyExpensesViewInput: AnyObject {
    
    func showExpenses(with model: MyExpensesViewModel)
    func calculateExpense(id: Int)
}

final class MyExpensesVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var presenter: MyExpensesViewOutput?
    var tableViewManager: MyExpensesTableViewManagerInput?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewIsReady()
        tableViewManager?.setup(tableView: tableView)
    }
    
    //MARK: - Private funcs
    
    private func setupView() {
        
        title = "Расходы"
        
        tableView.isHidden = true
        
        let addExpenseItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addExpenseDidTap))
        
        let setupExpensesItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(setupExpensesDidTap))
        
        navigationItem.rightBarButtonItem = addExpenseItem
        navigationItem.leftBarButtonItem = setupExpensesItem
    }
    
    @objc private func addExpenseDidTap() {
        
        presenter?.addExpenseDidTap()
    }
    
    @objc private func setupExpensesDidTap() {
        
        presenter?.setupExpensesDidTap()
    }
}

//MARK: - MyExpensesViewInput

extension MyExpensesVC: MyExpensesViewInput {
    
    func showExpenses(with model: MyExpensesViewModel) {
        
        tableView.isHidden = model.rows.isEmpty
        
        tableViewManager?.update(with: model)
    }
    
    func calculateExpense(id: Int) {
        
        let alertController = UIAlertController(title: "Расход",
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addTextField { textField in
            
            textField.keyboardType = .numberPad
            textField.placeholder = "Сумма расхода"
        }
        
        let action = UIAlertAction(title: "Вычесть расход", style: .default) { [weak self] action in
            
            guard let calculateExpense = alertController.textFields?[0].text,
                  calculateExpense != "" else { return }
            
            //TODO: - Подумать что можно сделать если расход превышает выделенную сумму
//            if Int(calculateExpense) ?? 0 > self?.expensesModel[indexPath.row].expenseSum ?? 0 {
//                return
//            }
            
            self?.presenter?.calculateExpense(id: id, sum: Int(calculateExpense) ?? 0)
        }
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
