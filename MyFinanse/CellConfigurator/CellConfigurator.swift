//
//  CellConfigurator.swift
//  Hoff
//
//  Created by Айдар Фатхутдинов on 27/05/2019.
//  Copyright © 2019 WeLike. All rights reserved.
//

import UIKit

protocol CellConfigurator {
    
    static var reuseId: String { get }
    
    func configure(cell: UIView)
    func associatedValue<T>() -> T?
}


// MARK: - Table

protocol TableCellConfiguratorProtocol: CellConfigurator {
    var cellHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
}


// MARK: - Collection

protocol CollectionCellConfiguratorProtocol: CellConfigurator {
    var size: CGSize { get }
}
