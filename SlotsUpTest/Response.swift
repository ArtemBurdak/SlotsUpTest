//
//  Data.swift
//  SlotsUpTest
//
//  Created by Artem on 6/26/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import Foundation

struct Response: Codable {
    let status: Int
    let data: TextResponse
}

struct TextResponse: Codable {
    let access: String
    let text: String
}
