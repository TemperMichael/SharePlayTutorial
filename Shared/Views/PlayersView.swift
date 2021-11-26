//
//  PlayersView.swift
//  SharePlayTutorial (iOS)
//
//  Created by Michael Temper on 26.11.21.
//

import SwiftUI

struct PlayersView: View {

    @ObservedObject var viewModel: SharePlayViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image(systemName: "face.smiling.fill")
                    .resizable()
                    .frame(width: viewModel.playerSize, height: viewModel.playerSize)
                    .foregroundColor(.blue)
                    .frame(width: viewModel.playerSize, height: viewModel.playerSize)
                    .padding(5)
                    .background(.background)
                    .cornerRadius(viewModel.playerSize / 2 + 5)

                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 10, height: 280)
                    .foregroundColor(.brown)

                Image(systemName: "face.smiling.fill")
                    .resizable()
                    .rotationEffect(.degrees(180))
                    .frame(width: viewModel.playerSize, height: viewModel.playerSize)
                    .foregroundColor(.red)
                    .frame(width: viewModel.playerSize, height: viewModel.playerSize)
                    .padding(5)
                    .background(.background)
                    .cornerRadius(viewModel.playerSize / 2 + 5)
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + viewModel.playersYOffset)
        }
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView(viewModel: SharePlayViewModel(model: SharePlayModel()))
            .previewLayout(.sizeThatFits)
    }
}
