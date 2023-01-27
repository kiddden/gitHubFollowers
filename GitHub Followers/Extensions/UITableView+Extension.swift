//
//  UITableView+Extension.swift
//  GitHub Followers
//
//  Created by Eugene Ned on 27.01.2023.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
}
