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
        tableViewManager?.setup(tableView: tableView)
        presenter?.viewIsReady()
    }
    
    //MARK: - Private funcs
    
    private func setupView() {
        
        title = "Расходы"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addExpenseDidTap))
        
//        tableView.isHidden = true
    }
    
    @objc private func addExpenseDidTap() {
        
        let alertController = UIAlertController(title: "Добавть расход", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Название расхода"
            textField.autocapitalizationType = .words
        }
        
        alertController.addTextField { textField in
            textField.keyboardType = .numberPad
            
            //TODO: - В настройках добавить курс
            textField.placeholder = "Сумма (₽)"
        }
        
        let doneAction = UIAlertAction(title: "Готово", style: .default) { [weak self] _ in
            
            guard let textFields = alertController.textFields else { return }
            
            guard let expenseName = textFields[0].text,
                  let expenseSum = textFields[1].text,
                  expenseName != "",
                  expenseSum != "" else { return }
            
            self?.presenter?.addExpense(name: expenseName, sum: Int(expenseSum) ?? 0)
        }
        
        alertController.addAction(doneAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: - MyExpensesViewInput

extension MyExpensesVC: MyExpensesViewInput {
    
    func showExpenses(with model: MyExpensesViewModel) {
        
        tableViewManager?.update(with: model)
    }
    
    func calculateExpense(id: Int) {
        
        let alertController = UIAlertController(title: "Расход", message: nil, preferredStyle: .alert)
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
