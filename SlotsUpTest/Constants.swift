//
//  Constants.swift
//  SlotsUpTest
//
//  Created by Artem on 6/25/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import Foundation

struct Constants {

    struct NetworkingURLs {
        private static let baseURL = "http://slotsup.tripland.net/api"
        static let login = baseURL + "/login"
    }

    struct Identifiers {
        static let collectionCell = "collectionCell"
        static let collectionVC = "CollectionVC"
    }
}
