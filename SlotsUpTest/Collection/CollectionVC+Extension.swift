//
//  CollectionVC+Extension.swift
//  SlotsUpTest
//
//  Created by Artem on 6/27/19.
//  Copyright © 2019 Artem. All rights reserved.
//
import UIKit

extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedDictionary.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.collectionCell, for: indexPath) as! CollectionCell
        cell.configure(data: sortedDictionary[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 2
        let screenWidth = self.view.frame.width
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 18, left: 18, bottom: 10, right: 18)
        layout.itemSize = CGSize(width: screenWidth/cellsAcross, height: screenWidth/cellsAcross)
        layout.minimumInteritemSpacing = 18
        layout.minimumLineSpacing = 18
        collectionView.collectionViewLayout = layout

        return CGSize(width: (screenWidth / 2) - 27, height: ((screenWidth / 2) - 27))
    }
}
