//
//  AddExpensePresenter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 26.11.2021.
//

import Foundation

protocol AddExpenseViewOutput: BaseViewOutput {
    
    func addExpense(name: String, sum: Int)
}

final class AddExpensePresenter {
    
    //MARK: - Properties
    
    private unowned let view: AddExpenseViewInput
    
    private let expenseManager: ExpensesManager = ExpensesManagerImp()
    
    //MARK: - Init
    
    init(
        view: AddExpenseViewInput
    ) {
        self.view = view
    }
}

//MARK: - ViewOutput

extension AddExpensePresenter: AddExpenseViewOutput {
    
    func viewIsReady() {}
    
    func addExpense(name: String, sum: Int) {
        
        let expense = ExpensesModel(expenseName: name, expenseSum: sum)
        expenseManager.saveExpense(expense: expense) { [weak self] _ in
            
            self?.view.dismissView()
        }
    }
}
