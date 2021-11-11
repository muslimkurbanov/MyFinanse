//
//  CollectionCellConfigurator.swift
//  Hoff
//
//  Created by Даниял Деветов on 25.10.2020.
//  Copyright © 2020 WeLike. All rights reserved.
//

import UIKit

struct CollectionCellConfigurator<CellType: Configurable, Model>: CollectionCellConfiguratorProtocol
where CellType.Model == Model, CellType: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: Model?
    var size: CGSize
    
    
    // MARK: - Init
    
    init(item: Model?, size: CGSize) {
        self.item = item
        self.size = size
    }
    
    
    // MARK: - Public methods
    
    func configure(cell: UIView) {
        guard let item = item else { return }
        (cell as? CellType)?.configure(with: item)
    }
    
    func associatedValue<T>() -> T? {
        return item as? T
    }
    
}
