//
//  ExpensesManager.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 09.11.2021.
//

import Foundation

protocol ExpensesManager {
    
    func loadExpenses(completion: @escaping ([ExpensesModel]) -> ())
    func saveExpense(expense: ExpensesModel, completion: @escaping ([ExpensesModel]) -> ())
    func deleteExpense(id: Int, completion: @escaping ([ExpensesModel]) -> ())
    func calculateExpense(id: Int, sum: Int, completion: @escaping ([ExpensesModel]) -> ())
}

final class ExpensesManagerImp: ExpensesManager {
    
    private let defaults = UserDefaults.standard
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private var expenses: [ExpensesModel] = []
    private let expensesKey = "EXPENSES_KEY"
    
    required init() {
        
        guard let expensesJSON = defaults.object(forKey: expensesKey) as? Data,
              let expenses = try? decoder.decode([ExpensesModel].self, from: expensesJSON) else { return }
        self.expenses = expenses
    }
    
    func loadExpenses(completion: @escaping ([ExpensesModel]) -> ()) {
        
        if !expenses.isEmpty {
            
            completion(expenses)
        } else {
            completion([])
        }
    }
    
    func saveExpense(expense: ExpensesModel, completion: @escaping ([ExpensesModel]) -> ()) {
        
        expenses.append(expense)
        
        let data = try? encoder.encode(expenses)
        defaults.setValue(data, forKey: expensesKey)
        
        completion(expenses)
    }
    
    func deleteExpense(id: Int, completion: @escaping ([ExpensesModel]) -> ()) {
        
        expenses.remove(at: id)
        
        let data = try? encoder.encode(expenses)
        defaults.setValue(data, forKey: expensesKey)
        
        completion(expenses)
    }
    
    func calculateExpense(id: Int, sum: Int, completion: @escaping ([ExpensesModel]) -> ()) {
        
        expenses[id].expenseSum -= sum
        
        let data = try? encoder.encode(expenses)
        defaults.setValue(data, forKey: expensesKey)
        
        completion(expenses)
    }
}
