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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: SharePlayViewModel(model: SharePlayModel()))
    }
}
