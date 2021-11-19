//
//  ExpensesDatePresenter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 12.11.2021.
//

import Foundation

protocol ExpensesDateViewOutput: BaseViewOutput {
    
}

final class ExpeneseDatePresenter {
    
    private unowned let view: ExpensesDateViewInput
    
    init(
        view: ExpensesDateViewInput
    ) {
        self.view = view
    }
}

extension ExpeneseDatePresenter: ExpensesDateViewOutput {
    
    func viewIsReady() {
        
    }
}
