//
//  CharecterCountViewController.swift
//  SlotsUpTest
//
//  Created by Artem on 6/26/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class CharacterCountViewController: UIViewController {

    private let network = Networking()

    var text = String()

    var sortedDictionary = [(key: Character, value: Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()

        splitIntoLetters(text: text)
    }

    func splitIntoLetters(text: String){

        var charactersCountDictionary = [Character: Int]()

        text.forEach {
            if let value = charactersCountDictionary[$0] {
                charactersCountDictionary[$0] = value + 1
            } else {
                charactersCountDictionary[$0] = 1
            }
        }
        sortedDictionary = charactersCountDictionary.sorted { $0 < $1 }
    }
}

extension CharacterCountViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedDictionary.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)

        let item = sortedDictionary[indexPath.row]
        cell.textLabel?.text = "'\(item.key)' - \(item.value) times"

        return cell
    }

}
