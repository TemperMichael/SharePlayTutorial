//
//  ContentView.swift
//  Shared
//
//  Created by Michael Temper on 26.11.21.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: SharePlayViewModel
    
    var body: some View {
        ZStack {
            GameFieldView(viewModel: viewModel)
            PlayersView(viewModel: viewModel)
            HUDView(viewModel: viewModel)
        }.task {
            for await session in SharePlayActivity.sessions() {
                viewModel.configureGroupSession(session)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: SharePlayViewModel(model: SharePlayModel()))
    }
}
