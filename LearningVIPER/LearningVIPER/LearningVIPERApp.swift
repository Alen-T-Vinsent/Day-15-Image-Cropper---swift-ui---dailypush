//
//  LearningVIPERApp.swift
//  LearningVIPER
//
//  Created by Apple  on 20/12/22.
//

import SwiftUI

@main
struct LearningVIPERApp: App {
    @StateObject var vm  = ContentViewModel(title: "hello", body: "jhghg")
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: vm)
        }
    }
}
