//
//  Error.swift
//  NetworkLayer
//
//  Created by Jade Yoo on 2023/07/06.
//

import Foundation

// 로그인 Error 타입 정의
enum APIError: Error {
    case http(ErrorData)
    case unknown
}

// 1. Error 타입 정의
enum TestAPIError: Error {
    case http(ErrorData)
    case unknown
}
 
// ErrorData 안에 들어갈 정보 선언
struct ErrorData: Codable {
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "errorMessage"
    }
}
