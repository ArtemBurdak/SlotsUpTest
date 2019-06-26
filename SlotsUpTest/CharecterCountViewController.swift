//
//  CharecterCountViewController.swift
//  SlotsUpTest
//
//  Created by Artem on 6/26/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class CharecterCountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let network = Networking()

    var arrayOfCharacters = [Character]()

    var text = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        text = network.text
        splitIntoLetters(text: text)


    }

    func splitIntoLetters(text: String) {
        for char in text {
            arrayOfCharacters.append(char)
        }
        print(arrayOfCharacters)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCharacters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharecterCell", for: indexPath)

        return cell
    }

}
