//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct CurrencyIcon: View {
	
	// MARK: - The Image of the Currency
	@State var currencyImage: String

	// MARK: - The Textual Representation of the Currency
	@State var currencyText: String

	// MARK: - The Material Color of the Currency
	@State var materialColor: MaterialColor
	
	// MARK: - Main User Interface
	var body: some View {
		// Creates a stack of views layered out from back to front
		ZStack {
			// Display the image of the currency
			Image(currencyImage)
				.resizable() // Resizes the image to fit the frame
				.scaledToFit() // Scales the image to fit within the frame while maintaining its aspect ratio
			
			// Display the name of the currency at the bottom
			VStack {
				Spacer() // Pushes the text to the bottom
				Text(currencyText)
					.padding(3) // Adds padding around the text
					.customFont(name: "Ringbearer", style: .caption1) // Applies a custom font to the text
					.background(materialColor.color.opacity(0.75)) // Adds a background to the text with a specified opacity
			}
		}
		.padding(3) // Adds padding around the stack
		.frame(width: 100, height: 100) // Sets the size of the frame
		.background(materialColor.color) // Sets the background color of the frame
		.cornerRadius(25) // Rounds the corners of the frame
	}
}

struct CurrencyIcon_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyIcon(currencyImage: "copperpenny", currencyText: "Copper Penny", materialColor: .bronze)
			.previewLayout(.sizeThatFits)
	}
}
