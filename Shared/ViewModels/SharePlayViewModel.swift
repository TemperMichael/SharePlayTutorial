//
//  SharePlayViewModel.swift
//  SharePlayTutorial (iOS)
//
//  Created by Michael Temper on 26.11.21.
//

import SwiftUI

@MainActor
class SharePlayViewModel: ObservableObject {

    @Published private var model: SharePlayModel

    var playersYOffset: Double { model.playersYOffset }
    var playersMovementAmount: Double = 10
    var playerSize: Double { playerRadius * 2 }
    var playerRadius: Double = 25

    var gameHoleSize: Double = 120

    var gameState: GameState? {
        switch model.playersYOffset {
        case let offset where offset < -gameHoleSize - playerRadius:
            return .playerOneWon
        case let offset where offset > gameHoleSize + playerRadius:
            return .playerTwoWon
        default:
            return .none
        }
    }

    init(model: SharePlayModel) {
        self.model = model
    }

    func increaseBallPosition() {
        model.playersYOffset += playersMovementAmount
    }

    func decreaseBallPosition() {
        model.playersYOffset -= playersMovementAmount
    }

    func resetGame() {
        model.playersYOffset = 0
    }
}
