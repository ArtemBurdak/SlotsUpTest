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

    var text = String()

    var sorted = [(key: Character, value: Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()

        splitIntoLetters(text: text)
    }

    func splitIntoLetters(text: String){

        var charectersCountDictionary = [Character: Int]()

        text.forEach {
            if let value = charectersCountDictionary[$0] {
                charectersCountDictionary[$0] = value + 1
            } else {
                charectersCountDictionary[$0] = 1
            }
        }

        sorted = charectersCountDictionary.sorted { $0 < $1 }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sorted.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharecterCell", for: indexPath)

        let item = sorted[indexPath.row]
        cell.textLabel?.text = "'\(item.key)' - \(item.value) times"

        return cell
    }

}
