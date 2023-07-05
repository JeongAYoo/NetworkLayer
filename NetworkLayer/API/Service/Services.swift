//
//  APIClient.swift
//  NetworkLayer
//
//  Created by Jade Yoo on 2023/07/06.
//

import Foundation
import Combine
import Alamofire

/// Test API 호출
enum TestAPIService {
    static let agent = Agent()
    static let base = "https://jayden-bin.kro.kr"
    static let header: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
 
    static func postUsername(username: String) -> AnyPublisher<TestNetworkResponse, TestAPIError> {
        let urlComponents = URLComponents(string: base + "/test")!
        let parameter: Parameters = [
            "name" : username
        ]

        let request = AF.request(urlComponents.url!, method: .post, parameters: parameter, encoding: JSONEncoding.prettyPrinted, headers: header)
        
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

/// 인증 관련 api 호출
enum AuthApiService {
   static let agent = APIService()
   
    static func kakaoRegister(username: String, email: String?, phoneNumber: String?, nickname: String, gender: String, birthday: [Int]) -> AnyPublisher<EmptyResponse, APIError> {
       print("AuthApiService - kakaoRegister() called")
       
       let request = ApiClient.shared.session.request(AuthRouter.kakaoRegister(username: username, email: email, phoneNumber: phoneNumber, nickname: nickname, gender: gender, birthday: birthday))
       
       return agent.run(request)
           .map(\.value)
           .eraseToAnyPublisher()
   }
}
