//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct ExchangeRate: View {
	
	// MARK: - The Image of the Left Currency
	@State var leftImage: String

	// MARK: - The Textual Representation of the Exchange Rate
	@State var text: String

	// MARK: - The Image of the Right Currency
	@State var rightImage: String
	
	// MARK: - Main User Interface
	var body: some View {
		// Creates a horizontal stack of views
		HStack {
			// Display the image of the left currency
			Image(leftImage)
				.resizable() // Resizes the image to fit the frame
				.scaledToFit() // Scales the image to fit within the frame while maintaining its aspect ratio
				.frame(height: 35) // Sets the height of the frame

			// Display the exchange rate text
			Text(text)
				.customFont(name: "Ringbearer", style: .caption1) // Applies a custom font to the text

			// Display the image of the right currency
			Image(rightImage)
				.resizable() // Resizes the image to fit the frame
				.scaledToFit() // Scales the image to fit within the frame while maintaining its aspect ratio
				.frame(height: 35) // Sets the height of the frame
		}
	}
}

struct ExchangeRate_Previews: PreviewProvider {
	static var previews: some View {
		ExchangeRate(leftImage: "goldpiece", text: "1 Gold Piece = 4 Gold Pennies", rightImage: "goldpenny")
			.previewLayout(.sizeThatFits)
	}
}
