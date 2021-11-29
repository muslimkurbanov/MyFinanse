//
//  AddExpenseImageVC.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 29.11.2021.
//

import UIKit

final class AddExpenseImageVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    //MARK: - Properties
    
    private let imageArray = [UIImage(systemName: "0.circle"),
                              UIImage(systemName: "1.circle"),
                              UIImage(systemName: "2.circle"),
                              UIImage(systemName: "3.circle"),
                              UIImage(systemName: "4.circle"),
                              UIImage(systemName: "5.circle"),
                              UIImage(systemName: "6.circle"),
                              UIImage(systemName: "7.circle"),
                              UIImage(systemName: "8.circle"),
                              UIImage(systemName: "9.circle")]
    
    var delegate: AddExpenseViewInput?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - IBActions
    
    
    
    //MARK: - Private funcs
    
    private func setupView() {
        
        //view
        
        title = "Картинка"
        view.backgroundColor = UIColor(named: "mainAppColor")
        
        let cancelItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelItemDidTap))
        
        navigationItem.leftBarButtonItem = cancelItem
        
        //collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor(named: "mainAppColor")
    }
    
    @objc private func cancelItemDidTap() {
        
        dismiss(animated: true, completion: nil)
    }
}

extension AddExpenseImageVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegate?.setImage(image: self.imageArray[indexPath.row] ?? UIImage())
        dismiss(animated: true)
    }
}

extension AddExpenseImageVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ExpenseImageCell else { return UICollectionViewCell() }
        
        cell.configurate(image: imageArray[indexPath.row] ?? UIImage())
        
        return cell
    }
}
