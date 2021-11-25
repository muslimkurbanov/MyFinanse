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
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //tableView
        clearsSelectionOnViewWillAppear = true
    }
    
    //MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
            case 0:
            
            self.navigationController?.show(SetupExpensesAssembly.assembleModule(), sender: nil)
            
            default: break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
