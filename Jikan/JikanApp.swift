//
//  JikanApp.swift
//  Jikan
//
//  Created by Avimanyu Roy on 19/05/23.
//

import SwiftUI

@main
struct JikanApp: App {
    @StateObject var api = JikanAPI()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(api)
        }
    }
}
