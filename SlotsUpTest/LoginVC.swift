//
//  ViewController.swift
//  SlotsUpTest
//
//  Created by Artem on 6/25/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func submitAction(_ sender: UIButton) {
        checkLoginIsEmty()
    }

    func checkLoginIsEmty() {

        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        submitLoginWith(login: login, password: password)
    }

    func submitLoginWith(login: String, password: String) {

        if !login.isEmpty, !password.isEmpty {
            let parameters = ["login": login, "password": password]

            Networking.login(parameters: parameters) { [weak self] (result) in

                switch result {
                case .success(let authResult):
                    if authResult.data.access == "1" {

                        guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: Constants.Identifiers.collectionVC) as? CollectionVC else { return }
                        vc.text = authResult.data.text
                        self?.show(vc, sender: self)
                    } else {
                        self?.showError(message: authResult.data.text)
                    }
                case .failure(let error):
                    self?.showError(message: error.localizedDescription)
                }
            }
        }
        else {
            self.showError(message: Constants.ErrorMessages.checkFields)
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
