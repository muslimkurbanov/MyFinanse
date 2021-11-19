//
//  SetupExpensesPresenter.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 12.11.2021.
//

import Foundation

protocol SetupExpensesViewOutput: BaseViewOutput {
    
}

final class SetupExpensesPresenter {
    
    //MARK: - Properties
    
    private unowned let view: SetupExpensesViewInput
    
    //MARK: - Init
    
    init(
        view: SetupExpensesViewInput
    ) {
        self.view = view
    }
}

//MARK: -  ViewOutput

extension SetupExpensesPresenter: SetupExpensesViewOutput {
    
    func viewIsReady() {
        
    }
}
