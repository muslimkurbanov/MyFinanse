//
//  AddExpensePresenter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 26.11.2021.
//

import Foundation

protocol AddExpenseViewOutput: BaseViewOutput {
    
    func addExpense(name: String, sum: Int)
    func expenseImageViewDidTap(delegate: AddExpenseVC)
}

final class AddExpensePresenter {
    
    //MARK: - Properties
    
    private unowned let view: AddExpenseViewInput
    private let router: AddExpenseRouterInput
    private let expenseManager: ExpensesManager = ExpensesManagerImp()
    
    //MARK: - Init
    
    init(
        view: AddExpenseViewInput,
        router: AddExpenseRouterInput
    ) {
        self.view = view
        self.router = router
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
    
    func expenseImageViewDidTap(delegate: AddExpenseVC) {
        
        router.showExpenseImageScreen(delegate: delegate)
    }
}
