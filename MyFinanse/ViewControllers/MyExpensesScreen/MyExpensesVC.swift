//
//  MyExpensesVC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import UIKit

protocol MyExpensesViewInput: AnyObject {
    
    func showExpenses(with model: [ExpensesModel])
}

final class MyExpensesVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var presenter: MyExpensesViewOutput?
    var expensesModel: [ExpensesModel] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewIsReady()
    }
    
    //MARK: - Private funcs
    
    private func setupView() {
        
        title = "Расходы"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addExpenseDidTap))
        navigationItem.rightBarButtonItem
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
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

//MARK: - UITableViewDelegate

extension MyExpensesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
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
            
            self?.presenter?.calculateExpense(id: indexPath.row, sum: Int(calculateExpense) ?? 0)
        }
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, _ in
            
            self?.presenter?.removeExpense(id: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

//MARK: - UITableViewDataSource

extension MyExpensesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return expensesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as? ExpenseCell else { return UITableViewCell() }
        
        cell.config(expensesModel[indexPath.row])
        return cell
    }
}

//MARK: - MyExpensesViewInput

extension MyExpensesVC: MyExpensesViewInput {
    
    func showExpenses(with model: [ExpensesModel]) {
        
        self.expensesModel = model
        tableView.isHidden = model.isEmpty
        tableView.reloadData()
    }
}
