//
//  Helpers.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import Foundation

func getMaterialColor(from currency: CurrencyText) -> MaterialColor {
	switch currency {
	case .copperPenny:
		return .bronze
	case .silverPenny, .silverPiece:
		return .silver
	case .goldPenny, .goldPiece:
		return .gold
	}
}
