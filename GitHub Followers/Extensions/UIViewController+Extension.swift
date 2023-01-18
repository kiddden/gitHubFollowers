//
//  UIViewController+Extension.swift
//  GitHub Followers
//
//  Created by Eugene Ned on 17.01.2023.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThred(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}