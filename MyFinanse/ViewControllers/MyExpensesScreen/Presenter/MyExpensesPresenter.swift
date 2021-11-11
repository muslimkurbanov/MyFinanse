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
}

final class MyExpensesPresenter {
    
    private unowned let view: MyExpensesViewInput
    private let router: MyExpensesRouterInput
    
    private var model: [ExpensesModel] = []
    private let expenseManager: ExpensesManager = ExpensesManagerImp()
    private let dataConverter: MyExpensesDataConverterInput
    
    init(
        view: MyExpensesViewInput,
        router: MyExpensesRouterInput,
        dataConverter: MyExpensesDataConverterInput
    ) {
        self.view = view
        self.router = router
        self.dataConverter = dataConverter
    }
}

extension MyExpensesPresenter: MyExpensesViewOutput {
    
    func viewIsReady() {
        
        expenseManager.loadExpenses { [weak self] result in
            
            guard let viewModel = self?.dataConverter.convert(with: result, delegate: self?.view) else { return }
            
            self?.view.showExpenses(with: viewModel)
        }
    }
    
    func addExpense(name: String, sum: Int) {
        
        let newExpense = ExpensesModel(expenseName: name, expenseSum: sum)
        
        expenseManager.saveExpense(expense: newExpense) { [weak self] result in
            
            guard let viewModel = self?.dataConverter.convert(with: result, delegate: self?.view) else { return }
            
            self?.view.showExpenses(with: viewModel)
        }
    }
    
    func calculateExpense(id: Int, sum: Int) {
        
        expenseManager.calculateExpense(id: id, sum: sum) { [weak self] result in
            
            guard let viewModel = self?.dataConverter.convert(with: result, delegate: self?.view) else { return }
            
            self?.view.showExpenses(with: viewModel)
        }
    }
}

extension MyExpensesPresenter: MyExpensesTableViewManagerDelegate {
    
    func didSelect(id: Int) {
        
        self.view.calculateExpense(id: id)
    }
    
    func didLeadingSwipe(id: Int) {
        
        expenseManager.deleteExpense(id: id) { [weak self] result in
            
            guard let viewModel = self?.dataConverter.convert(with: result, delegate: self?.view) else { return }
            
            self?.view.showExpenses(with: viewModel)
        }
    }
}
