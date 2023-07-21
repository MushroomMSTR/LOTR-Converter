//
//  Currency.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import SwiftUI

// MARK: - Currency Enum
// This enum represents different types of currencies in the Lord of the Rings universe.
enum Currency: Double, CaseIterable {
	case copperPenny = 640  // The value of a Copper Penny.
	case silverPenny = 64  // The value of a Silver Penny.
	case silverPiece = 16  // The value of a Silver Piece.
	case goldPenny = 4  // The value of a Gold Penny.
	case goldPiece = 1  // The value of a Gold Piece.
	
	// This method converts an amount of money from one currency to another.
	func convert(amountString: String, to currency: Currency) -> String {
		// Try to convert the string to a Double.
		guard let startAmount = Double(amountString) else {
			return ""
		}
		
		// Calculate the converted amount.
		let convertedAmount = (startAmount / self.rawValue) * currency.rawValue
		
		// Format the converted amount to two decimal places.
		if convertedAmount > 0 {
			return String(format: "%.2f", convertedAmount)
		} else {
			return ""
		}
	}
}

// MARK: - CurrencyText Enum
// This enum provides the display text for each type of currency.
enum CurrencyText: String, CaseIterable {
	case copperPenny = "Copper Penny"
	case silverPenny = "Silver Penny"
	case silverPiece = "Silver Piece"
	case goldPenny = "Gold Penny"
	case goldPiece = "Gold Piece"
}

// MARK: - CurrencyImage Enum
// This enum provides the image names for each type of currency.
enum CurrencyImage: String, CaseIterable {
	case copperPenny = "copperpenny"
	case silverPenny = "silverpenny"
	case silverPiece = "silverpiece"
	case goldPenny = "goldpenny"
	case goldPiece = "goldpiece"
}

// MARK: - MaterialColor Enum
// This enum represents different types of material colors.
enum MaterialColor: String {
	case bronze = "Bronze"
	case silver = "Silver"
	case gold = "Gold"
	
	// This computed property provides a SwiftUI Color for each material color.
	var color: Color {
		switch self {
		case .bronze:
			return .brown
		case .silver:
			return .gray
		case .gold:
			return .yellow
		}
	}
}
