//
//  Data.swift
//  SlotsUpTest
//
//  Created by Artem on 6/26/19.
//  Copyright © 2019 Artem. All rights reserved.
//

struct AuthResult: Codable {
    let status: Int
    let data: AuthResultData
}

struct AuthResultData: Codable {
    let access: String
    let text: String
}

