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

    static func login(parameters: [String : String],
                      completion: @escaping (Result<AuthResult>) -> Void) {

        Alamofire.request(Constants.NetworkingURLs.login, method: .post,
                          parameters: parameters).validate().responseJSON { response in

                            switch response.result {
                            case .success:
                                guard
                                    let data = response.data,
                                    let authResult = try? JSONDecoder().decode(AuthResult.self, from: data)
                                    else { completion(.failure(NetworkingError.notSerialazibleData)); return }

                                completion(.success(authResult))

                            case .failure(let error):
                                completion(.failure(error))
                            }
        }
    }
}

enum NetworkingError: Error {
    case notSerialazibleData
}
