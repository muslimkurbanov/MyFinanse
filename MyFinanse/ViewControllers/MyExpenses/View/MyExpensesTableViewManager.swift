//
//  MyExpensesTableViewManager.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 11.11.2021.
//

import UIKit

protocol MyExpensesTableViewManagerInput {
    func setup(tableView: UITableView)
    func update(with viewModel: MyExpensesViewModel)
}

protocol MyExpensesTableViewManagerDelegate: AnyObject {
    func didSelect(id: Int)
    func didLeadingSwipe(id: Int)
}

final class MyExpensesTableViewManager: NSObject {
    
    // MARK: - Properties

    weak var delegate: MyExpensesTableViewManagerDelegate?
    private weak var tableView: UITableView?
    private var viewModel: MyExpensesViewModel?
}

// MARK: - CancelOrderTableViewManagerInput

extension MyExpensesTableViewManager: MyExpensesTableViewManagerInput {
    
    func setup(tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView = tableView
    }
    
    func update(with viewModel: MyExpensesViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
        
    }
}

// MARK: - UITableViewDataSource

extension MyExpensesTableViewManager: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.rows[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        row.configurator.configure(cell: cell)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MyExpensesTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelect(id: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, _ in
            
            self?.delegate?.didLeadingSwipe(id: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
