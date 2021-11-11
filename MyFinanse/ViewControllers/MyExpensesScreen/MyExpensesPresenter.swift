//
//  MyExpensesPresenter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 07.11.2021.
//

import Foundation

protocol MyExpensesViewOutput: BaseViewOutput {
    
    func addExpense(name: String, sum: Int)
    func calculateExpense(id: Int, sum: Int)
    func removeExpense(id: Int)
}

final class MyExpensesPresenter {
    
    private unowned let view: MyExpensesViewInput
    private let router: MyExpensesRouterInput
    private var model: [ExpensesModel] = []
    private let expenseManager: ExpensesManager = ExpensesManagerImp()
    
    init(
        view: MyExpensesViewInput,
        router: MyExpensesRouterInput
    ) {
        self.view = view
        self.router = router
    }
}

extension MyExpensesPresenter: MyExpensesViewOutput {
    
    func viewIsReady() {
        
        expenseManager.loadExpenses { [weak self] result in
            
            self?.view.showExpenses(with: result)
        }
    }
    
    func addExpense(name: String, sum: Int) {
        
        let newExpense = ExpensesModel(expenseName: name, expenseSum: sum)
        
        expenseManager.saveExpense(expense: newExpense) { [weak self] result in
            
            self?.view.showExpenses(with: result)
        }
    }
    
    func removeExpense(id: Int) {
        
        expenseManager.deleteExpense(id: id) { [weak self] result in
            
            self?.view.showExpenses(with: result)
        }
    }
    
    func calculateExpense(id: Int, sum: Int) {
        
        expenseManager.calculateExpense(id: id, sum: sum) { [weak self] result in
            
            self?.view.showExpenses(with: result)
        }
    }
}
