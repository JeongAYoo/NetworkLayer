//
//  SighUpViewModel.swift
//  ApiStudy
//
//  Created by Heeoh Son on 2023/06/29.
//

import Foundation
import Alamofire
import Combine

class AuthVM: ObservableObject {
    var subscription = Set<AnyCancellable>()
    
    @Published var loggedInUser: UserInfo? = nil
    
    /// 회원가입
    func kakaoRegister(username: String,
                       email: String?,
                       phoneNumber: String?,
                       nickname: String,
                       gender: String,
                       birthday: [Int],
                       completion: @escaping (Bool, String?) -> Void)  {
        print("AuthVM - kakaoRegister() called")
        var isSuccess = false
        var errorMessage: String? = nil
        
        AuthApiService.kakaoRegister(username: username, email: email, phoneNumber: phoneNumber, nickname: nickname, gender: gender, birthday: birthday)
            .sink { apiCompletion in
                switch apiCompletion {
                case .finished:
                    print("failure finished")
                    isSuccess = true
                    errorMessage = nil
                case .failure(let error):
                    isSuccess = false
                    switch error {
                    case .http(let errorData):
                        print("apiCompletion failure: \(errorData.message)")
                        errorMessage = errorData.message
                    default:
                        debugPrint("apiCompletion failure: \(error)")
                        errorMessage = error.localizedDescription
                    }
                }
                completion(isSuccess, errorMessage)
            } receiveValue: { response in
                debugPrint(response)
            }.store(in: &subscription)
    }
}
