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

    let networking = Networking()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func submitAction(_ sender: UIButton) {

        guard let login = loginTextField.text else { return }
        guard let password = loginTextField.text else { return }

        if login == "admin" && password == "admin" {

        let parameters: [String: String] = ["login": login, "password": password]
        networking.requestUserAuthorization(url: Constants.apiUrl, parameters: parameters)

        } else {
            showError()
        }
    }

    func showError() {

        let alertController = UIAlertController(title: "Ooops", message: "Wrong login or password", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true, completion: nil)
    }

}

