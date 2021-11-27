//
//  AddExpenseVC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 26.11.2021.
//

import UIKit

protocol AddExpenseViewInput: AnyObject {
    
    func dismissView()
}

final class AddExpenseVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var expenseNameTextField: UITextField!
    @IBOutlet private weak var expenseSumTextField: UITextField!
    @IBOutlet private weak var expenseImageView: UIImageView!
    
    //MARK: - Properties
    
    var presenter: AddExpensePresenter?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewIsReady()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    
    @IBAction private func addExpenseAction(_ sender: UIButton) {
        
        guard let expenseName = expenseNameTextField.text,
              let expenseSum = expenseSumTextField.text,
              expenseName != "",
              expenseSum != "" else { return }
        
        presenter?.addExpense(name: expenseName, sum: Int(expenseSum) ?? 0)
    }
    
    @IBAction private func editExpenseImageAction(_ sender: UIButton) {
        
        expenseImageViewDidTap()
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
        
        let cancelItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelItemDidTap))
        
        navigationItem.leftBarButtonItem = cancelItem
        
        //textFields
        expenseNameTextField.delegate = self
        expenseSumTextField.delegate = self
        
        expenseNameTextField.becomeFirstResponder()
        
        //imageViews
        let expenseImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(expenseImageViewDidTap))
        
        expenseImageView.addGestureRecognizer(expenseImageTapGesture)
    }
    
    @objc private func expenseImageViewDidTap() {
        
        
    }
    
    @objc private func cancelItemDidTap() {
        
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - UITextFieldDelegate

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

//MARK: - ViewInput

extension AddExpenseVC: AddExpenseViewInput {
    
    func dismissView() {
        
        dismiss(animated: true, completion: nil)
    }
}
