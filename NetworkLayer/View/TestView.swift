//
//  TestView.swift
//  NetworkingWithCombine
//
//  Created by Jade Yoo on 2023/07/01.
//

import SwiftUI

struct TestView: View {
    // MARK: - Properties
    
    @State var name = ""
    @StateObject var viewModel = TestViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 25) {
            TextField("이름을 입력하세요.", text: $name)
                .submitLabel(.done)
                .frame(height: 48)
                .background(Color(.systemGroupedBackground))
                .onSubmit {
                    viewModel.submitUsername(username: name)
                }
            
            Button {
                viewModel.submitUsername(username: name)

            } label: {
                Text("제출")
                    .foregroundColor(.white)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
            }
            .background(.black)

        }
        .padding(.horizontal)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
