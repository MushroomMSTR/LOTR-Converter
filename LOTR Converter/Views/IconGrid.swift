//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import SwiftUI

struct IconGrid: View {
	
	// MARK: - Layout for the Grid
	@State var gridLayout = [GridItem(), GridItem(), GridItem()]

	// MARK: - Current Selected Currency
	@Binding var currency: Currency
	
	// MARK: - Main User Interface
	var body: some View {
		// Create a vertical grid with 3 columns
		LazyVGrid(columns: gridLayout) {
			// For each currency type
			ForEach(0..<5) { i in
				// If the current currency type is the selected currency
				if Currency.allCases[i] == currency {
					// Display the currency icon with a highlighted border and shadow
					CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue,
								 currencyText: CurrencyText.allCases[i].rawValue,
								 materialColor: getMaterialColor(from: CurrencyText.allCases[i]))
					.overlay(RoundedRectangle(cornerRadius: 25)
						.stroke(Color.black, lineWidth: 3)
						.opacity(0.5))
					.shadow(color: .black, radius: 7)
				} else {
					// Otherwise, display the currency icon normally
					CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue,
								 currencyText: CurrencyText.allCases[i].rawValue,
								 materialColor: getMaterialColor(from: CurrencyText.allCases[i]))
					// When the icon is tapped, update the selected currency
					.onTapGesture {
						currency = Currency.allCases[i]
					}
				}
				
			}
		}
		// Add padding to the bottom and sides of the grid
		.padding([.bottom, .leading, .trailing])
	}
}

struct IconGrid_Previews: PreviewProvider {
	static var previews: some View {
		IconGrid(currency: .constant(.silverPiece))
	}
}
