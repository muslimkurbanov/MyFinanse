//
//  MyExpensesDataConverter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 11.11.2021.
//

import Foundation

protocol MyExpensesDataConverterInput {
    
    func convert(with expenses: [ExpensesModel], delegate: AnyObject?) -> MyExpensesViewModel
}

final class MyExpensesDataConverter { }

extension MyExpensesDataConverter: MyExpensesDataConverterInput {
    
    private typealias Row = MyExpensesViewModel.Row
    private typealias ExpensesConfigurator = TableCellConfigurator<ExpenseCell, ExpenseCell.Model>
    
    func convert(with expenses: [ExpensesModel], delegate: AnyObject?) -> MyExpensesViewModel {
        
        let rows: [MyExpensesViewModel.Row] = expenses.map { expense in
            
            var row: MyExpensesViewModel.Row
            
            let model = ExpenseCell.Model(delegate: delegate as? ExpenseCellDelegate, expense: expense)
            let configurator = ExpensesConfigurator(item: model)
            row = MyExpensesViewModel.Row(configurator: configurator)
            
            return row
        }
        
        return MyExpensesViewModel(rows: rows)
    }
}
