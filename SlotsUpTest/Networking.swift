//
//  Networking.swift
//  SlotsUpTest
//
//  Created by Artem on 6/25/19.
//  Copyright © 2019 Artem. All rights reserved.
//

import Foundation
import Alamofire

struct Networking {

    static func login(url: String, parameters: [String : String], completion: @escaping (AuthResult) -> Void) {

        Alamofire.request(url, method: .post,
                          parameters: parameters).validate().responseJSON { response in

                            guard let data = response.data else { return }
                            guard let authResult = try? JSONDecoder().decode(AuthResult.self, from: data) else { return }
                            completion(authResult)
        }
    }
}
