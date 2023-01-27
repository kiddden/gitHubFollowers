//
//  UIView+Extension.swift
//  GitHub Followers
//
//  Created by Eugene Ned on 27.01.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
