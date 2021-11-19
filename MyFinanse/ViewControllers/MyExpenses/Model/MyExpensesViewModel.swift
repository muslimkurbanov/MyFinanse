//
//  MyExpensesViewModel.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 11.11.2021.
//

import Foundation

struct MyExpensesViewModel {
    
    let rows: [Row]
    
    struct Row {
        
        let configurator: TableCellConfiguratorProtocol
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}

