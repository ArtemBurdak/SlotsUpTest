//
//  CllectionViewController.swift
//  SlotsUpTest
//
//  Created by Artem on 6/27/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {

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

        for (index,dict) in sortedDictionary.enumerated() {
            if dict.key == " " {
                sortedDictionary[index].key = "␣"
            }
        }
    }
}
