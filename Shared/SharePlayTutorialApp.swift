//
//  SharePlayTutorialApp.swift
//  Shared
//
//  Created by Michael Temper on 26.11.21.
//

import SwiftUI

@main
struct SharePlayTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: SharePlayViewModel(model: SharePlayModel()))
            #if os(macOS)
                .frame(minWidth: 300, minHeight: 700)
            #endif
        }
    }
}
