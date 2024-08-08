//
//  FakeNetworkManager.swift
//  PopCornMoviesTests
//
//  Created by Consultant on 8/22/23.
//

import Foundation
import Alamofire

@testable import PopCornMovies

class FakeNetworkManager<T:Codable>{
    static func sharedInstance(completionHandler:@escaping(Result<MoviesModel,NetworkError>) -> Void){
            AF.request("TestAPI.json").responseDecodable(of: MoviesModel.self) { response in
                if response.error != nil{
                    completionHandler(.failure(NetworkError.responseError))
                    print(response.error?.localizedDescription as Any)
                    return
                }
                if let payload = response.value {
                    completionHandler(.success(payload))
                    print(payload)
                    return
                }
                completionHandler(.failure(NetworkError.doNotFoundError))

            }

        }
}
