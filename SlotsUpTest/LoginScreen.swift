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

        let parameters = ["login": login, "password": password]
        networking.requestUserAuthorization(url: Constants.apiUrl,
                                            parameters: parameters) { text in

            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

            guard let success = self.networking.success else { return }
            if success {

                if let vc = storyBoard.instantiateViewController(withIdentifier: "CharacterCountTable") as? CharacterCountViewController {
                vc.text = text
                self.show(vc, sender: self)
                }
            } else {
                self.showError(whith: text)
            }
        }
    }

    func showError(whith text: String) {

        let alertController = UIAlertController(title: "Wrong login or password",
                                                message: text,
                                                preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true, completion: nil)
    }

}
