//
//  Response.swift
//  NetworkLayer
//
//  Created by Jade Yoo on 2023/07/06.
//

import Foundation

// 디코딩 가능한 빈 Response
struct EmptyResponse : Codable {}

// Test API Response
struct TestNetworkResponse: Codable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "hashValue"
        case name = "originalName"
    }
}
