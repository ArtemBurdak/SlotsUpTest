//
//  Networking.swift
//  SlotsUpTest
//
//  Created by Artem on 6/25/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import Foundation
import Alamofire

class Networking {

    var text = String()

    var sucsess: Bool?

    func requestUserAuthorization(url: String, parameters: [String : String]) {

        Alamofire.request(url, method: .post,
                          parameters: parameters).validate().responseJSON {
                            response in
                            guard let data = response.data else { return }
                            self.decode(json: data)
                            print(response)
        }

    }

    func decode(json: Data) {
        let decoder = JSONDecoder()

        if let networkingData = try? decoder.decode(Response.self, from: json) {
            let networkResponse = networkingData

            self.text = networkResponse.data.text
            print(text)

            sucsess = accessResult(response: networkResponse.data.access)
            print(networkResponse.data.access, "----------access")
            print(sucsess, "------sucsess")

        }
    }

    func accessResult(response: String) -> Bool {
        if response == "1" {
            return true
        } else {
            return false
        }
    }

}
