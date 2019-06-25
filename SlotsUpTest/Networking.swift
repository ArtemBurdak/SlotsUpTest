//
//  Networking.swift
//  SlotsUpTest
//
//  Created by Artem on 6/25/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import Foundation

struct Networking {

    func requestUserAuthorization(url: String, parameters: [String : String]) {

        guard let url: URL = URL(string: url) else {return}
        let parameters = parameters
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response, "-----response")
            }
            guard let data = data else { return }
            print(data, "------")
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
    }

}
