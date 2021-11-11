//
//  MyExpensesViewModel.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 11.11.2021.
//

import Foundation

struct MyExpensesModel {
    
    let rows: [Row]
    
    struct Row {
        
        let configurator: TableCellConfiguratorProtocol
        
        var resueId: String {
            return type(of: configurator).reuseId
        }
    }
}
