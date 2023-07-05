//
//  Error.swift
//  NetworkLayer
//
//  Created by Jade Yoo on 2023/07/06.
//

import Foundation

// 로그인 Error 타입 정의
enum APIError: Error {
    case BAD_REQUEST(ErrorData)             // 400 Bad request / Request is invalid
    case UNAUTHORIZED(ErrorData)            // 401 Token is invalid / Unauthenticated Access
    case FORBIDDEN(ErrorData)               // 403 Permission is invalid
    case METHOD_NOT_ALLOWED(ErrorData)      // 405 Http Method is invalid
    case CONFLICT(ErrorData)                // 409 Request resource already exists
    case INTERNAL_SERVER_ERROR(ErrorData)   // 500 Internal server error
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
