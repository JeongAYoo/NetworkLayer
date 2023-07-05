//
//  MainTabView.swift
//  NetworkLayer
//
//  Created by Jade Yoo on 2023/07/06.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            AuthView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Auth")
                }
            TestView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Test")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
