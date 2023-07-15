//
//  Currency.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import Foundation

enum Currency: Double, CaseIterable {
	case copperPenny = 640
	case silverPenny = 64
	case silverPiece = 16
	case goldPenny = 4
	case goldPiece = 1
}

enum CurrencyText: String, CaseIterable {
	case copperPenny = "Copper Penny"
	case silverPenny = "Silver Penny"
	case silverPiece = "Silver Piece"
	case goldPenny = "Gold Penny"
	case goldPiece = "Gold Piece"
}

enum currencyImage: String, CaseIterable {
	case copperPenny = "copperpenny"
	case silverPenny = "silverpenny"
	case silverPiece = "silverpiece"
	case goldPenny = "goldpenny"
	case goldPiece = "goldpiece"
}
