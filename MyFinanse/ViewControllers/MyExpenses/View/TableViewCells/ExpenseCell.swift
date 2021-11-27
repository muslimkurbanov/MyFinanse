//
//  ExpenseCell.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 08.11.2021.
//

import UIKit

protocol ExpenseCellDelegate: AnyObject {
    
}

final class ExpenseCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var expenseNameLabel: UILabel!
    @IBOutlet private weak var expenseCheckLabel: UILabel!
    
    //MARK: - Properties
    
    private weak var delegate: ExpenseCellDelegate?
}

extension ExpenseCell: Configurable {
    
    struct Model {
        var delegate: ExpenseCellDelegate?
        var expense: ExpensesModel
    }
    
    func configure(with model: Model) {
        
        delegate = model.delegate
        
        expenseNameLabel.text = model.expense.expenseName
        expenseCheckLabel.text = String(model.expense.expenseSum) + " ₽"
        
        if model.expense.expenseSum < 0 {
            
            expenseCheckLabel.textColor = .red
            
        } else {
            
            expenseCheckLabel.textColor = .systemGreen
        }
    }
}
