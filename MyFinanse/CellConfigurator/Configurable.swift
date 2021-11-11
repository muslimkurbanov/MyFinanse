//
//  Configurable.swift
//  Hoff
//
//  Created by Айдар Фатхутдинов on 27/05/2019.
//  Copyright © 2019 WeLike. All rights reserved.
//

import Foundation

protocol Configurable {
    associatedtype Model
    func configure(with model: Model)
}
