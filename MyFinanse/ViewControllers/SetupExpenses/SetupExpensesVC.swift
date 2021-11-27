//
//  SetupExpensesVC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 12.11.2021.
//

import UIKit

final class SetupExpensesVC: UITableViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - Private funcs
    
    private func setupView() {
        
        //view
        title = "Настроить расходы"
        
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
        
        //tableView
        clearsSelectionOnViewWillAppear = true
    }
    
    @objc private func cancelItemDidTap() {
        
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - TableViewDelegate

extension SetupExpensesVC {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
            //case 0:
            
            //self.navigationController?.show(SetupExpensesAssembly.assembleModule(), sender: nil)
            
        default: break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
