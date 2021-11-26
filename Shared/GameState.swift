//
//  GameState.swift
//  SharePlayTutorial (iOS)
//
//  Created by Michael Temper on 26.11.21.
//

import Foundation

enum GameState {
    case playerOneWon
    case playerTwoWon

    var title: String? {
        switch self {
        case .playerOneWon:
            return "Player 1 won!"
        case .playerTwoWon:
            return "Player 2 won!"
        }
    }
}
