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
        networking.requestUserAuthorization(url: Constants.apiUrl, parameters: parameters)
//        if networking.sucsess == true {

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CharacterCountTable") as! CharecterCountViewController
        self.present(vc, animated: true, completion: nil)

//        } else {
//            showError()
//        }
    }

    func showError() {

        let alertController = UIAlertController(title: "Ooops", message: "Wrong login or password", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true, completion: nil)
    }

}
