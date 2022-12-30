//
//  vippeerApp.swift
//  vippeer
//
//  Created by Apple  on 28/12/22.
//

import SwiftUI

@main
struct vippeerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
