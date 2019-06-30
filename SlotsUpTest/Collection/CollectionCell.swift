//
//  CollectionCell.swift
//  SlotsUpTest
//
//  Created by Artem on 6/27/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var character: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        count.text = ""
        character.text = ""
    }

    func configure(data: (key: Character, value: Int)) {
        count.text = String(data.value)
        character.text = String(data.key)

        layer.cornerRadius = 10
        count.layer.cornerRadius = 15
        character.layer.cornerRadius = 35
    }
}

