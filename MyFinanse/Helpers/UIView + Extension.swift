//
//  UIView + Extension.swift
//  MyFinanse
//
//  Created by Муслим Курбанов on 19.11.2021.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
