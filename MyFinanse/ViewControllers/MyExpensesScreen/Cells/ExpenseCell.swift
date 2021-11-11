//
//  ExpenseCell.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 08.11.2021.
//

import UIKit

final class ExpenseCell: UITableViewCell {
    
    @IBOutlet private weak var expenseNameLabel: UILabel!
    @IBOutlet private weak var expenseCheckLabel: UILabel!
    
    func config(_ model: ExpensesModel) {
        
        expenseNameLabel.text = model.expenseName
        expenseCheckLabel.text = String(model.expenseSum) + " ₽"
        
        if model.expenseSum < 0 {
            
            expenseCheckLabel.textColor = .red
        } else {
            
            expenseCheckLabel.textColor = .label
        }
    }
}
