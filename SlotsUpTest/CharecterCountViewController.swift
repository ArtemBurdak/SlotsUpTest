//
//  CharecterCountViewController.swift
//  SlotsUpTest
//
//  Created by Artem on 6/26/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class CharecterCountViewController: UIViewController {

    let network = Networking()

    var text = String()

    var sortedDictionary = [(key: Character, value: Int)]()

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
        sortedDictionary = charectersCountDictionary.sorted { $0 < $1 }
    }

}

extension CharecterCountViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedDictionary.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        let item = sortedDictionary[indexPath.row]
        cell.textLabel?.text = "'\(item.key)' - \(item.value) times"

        return cell
    }

}
