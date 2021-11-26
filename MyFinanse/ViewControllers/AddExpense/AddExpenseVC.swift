//
//  AddExpenseVC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 26.11.2021.
//

import UIKit

final class AddExpenseVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var expenseNameTextField: UITextField!
    @IBOutlet private weak var expenseSumTextField: UITextField!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
    //MARK: - Private funcs
    
    private func setupView() {
        
        //view
        title = "Добавить расход"
        
        //navigationContoller
        if #available(iOS 15.0, *) {
            
            navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance.shadowColor = nil
            navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor(named: "mainAppColor")
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            navigationController?.navigationBar.tintColor = .white
        }
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "mainAppColor")
        navigationController?.navigationBar.tintColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //textFields
        expenseNameTextField.delegate = self
        expenseSumTextField.delegate = self
        
        expenseNameTextField.becomeFirstResponder()
    }
}

extension AddExpenseVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == expenseNameTextField {
            expenseSumTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        
        return true
    }
}
