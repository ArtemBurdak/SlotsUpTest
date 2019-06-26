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

    var success: Bool?

    func requestUserAuthorization(url: String, parameters: [String : String], completion: @escaping (String) -> (Void)) {

        Alamofire.request(url, method: .post,
                          parameters: parameters).validate().responseJSON {
                            response in
                            guard let data = response.data else { return }
                            self.decode(json: data)
                            completion(self.text)
                            print(response)
        }

    }

    func decode(json: Data) {
        let decoder = JSONDecoder()

        if let networkingData = try? decoder.decode(Response.self, from: json) {
            let networkResponse = networkingData

            self.text = networkResponse.data.text

            success = accessResult(response: networkResponse.data.access)
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
