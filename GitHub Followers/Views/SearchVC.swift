//
//  SearchVC.swift
//  GitHub Followers
//
//  Created by Eugene Ned on 16.01.2023.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField(placeholder: "Enter a username", borderColor: UIColor.systemGray4.cgColor)
    let actionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEmpty: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureImageLogoView()
        configureTextField()
        congifureButton()
        createKeyboardDismissGesture()
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createKeyboardDismissGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushUsernameToFollowerListVC() {
        guard isUsernameEmpty else {
            presentGFAlertOnMainThred(title: "Username field is empty", message: "Please enter a username to look for 🧐", buttonTitle: "Got it!")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureImageLogoView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            usernameTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func congifureButton() {
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushUsernameToFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            actionButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushUsernameToFollowerListVC()
        return true
    }
}
