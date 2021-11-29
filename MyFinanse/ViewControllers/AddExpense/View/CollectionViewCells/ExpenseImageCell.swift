//
//  ExpenseImageCell.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 29.11.2021.
//

import UIKit

final class ExpenseImageCell: UICollectionViewCell {
    
    @IBOutlet private weak var expenseImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        expenseImageView.tintColor = .white
    }
    
    func configurate(image: UIImage) {
        
        expenseImageView.image = image
    }
}
