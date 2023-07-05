//
//  APIService.swift
//  NetworkingWithCombine
//
//  Created by Jade Yoo on 2023/06/28.
//

import Foundation
import Combine
import Alamofire
 
struct Agent {
    // Resonse 선언
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
 
    func run<T: Decodable>(_ request: DataRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, TestAPIError> {
        return request.validate(statusCode: 200..<300).publishData().tryMap { result -> Response<T> in
            debugPrint(result)
            if let error = result.error {
                if let errorData = result.data {
                    let value = try decoder.decode(ErrorData.self, from: errorData)
                    throw TestAPIError.http(value)
                }
                else {
                    throw error
                }
            }
            if let data = result.data {
            // 응답이 성공이고 result가 있을 때
                let value = try decoder.decode(T.self, from: data)
                return Response(value: value, response: result.response!)
            } else {
            // 응답이 성공이고 result가 없을 때 Empty를 리턴
                return Response(value: Empty.emptyValue() as! T, response: result.response!)
            }
        }
        .mapError({ (error) -> TestAPIError in
            if let apiError = error as? TestAPIError {
                return apiError
            } else {
                return .unknown
            }
        })
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

