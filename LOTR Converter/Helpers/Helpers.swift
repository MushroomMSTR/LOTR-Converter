//
//  Helpers.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import Foundation

// MARK: - Function to Get Material Color from Currency
// This function takes a currency as input and returns the corresponding material color
func getMaterialColor(from currency: CurrencyText) -> MaterialColor {
	
	// Switch on the provided currency
	switch currency {
		
	// If the currency is a copper penny, return bronze
	case .copperPenny:
		return .bronze
		
	// If the currency is a silver penny or silver piece, return silver
	case .silverPenny, .silverPiece:
		return .silver
		
	// If the currency is a gold penny or gold piece, return gold
	case .goldPenny, .goldPiece:
		return .gold
	}
}

