//
//  ViewController.swift
//  SlotsUpTest
//
//  Created by Artem on 6/25/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func submitAction(_ sender: UIButton) {
        guard let login = loginTextField.text else { return }
        guard let password = loginTextField.text else { return }

        if !login.isEmpty, !password.isEmpty {
            let parameters = ["login": login, "password": password]

            Networking.login(url: Constants.NetworkingURLs.login,
                             parameters: parameters) { [weak self] (authResult)  in

                if authResult.data.access == "1" {
                    guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.collectionVC) as? CollectionVC else { return }
                    vc.text = authResult.data.text
                    self?.show(vc, sender: self)
                } else {
                    self?.showError(message: authResult.data.text)
                }
            }

        } else {
            showError(message: "Check your logIn and password fields")
        }
    }

    func showError(message: String) {
        let alertController = UIAlertController(title: "Ooops",
                                                message: message,
                                                preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true, completion: nil)
    }
}
