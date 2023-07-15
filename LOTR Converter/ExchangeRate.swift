//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct ExchangeRate: View {
	
	@State var leftImage: String
	@State var text: String
	@State var rightImage: String
	
	var body: some View {
		HStack {
			// Left
			Image(leftImage)
				.resizable()
				.scaledToFit()
				.frame(height: 35)
			
			// Exchange rate text
			Text(text)
				.customFont(name: "Ringbearer", style: .caption1)
			
			// Right
			Image(rightImage)
				.resizable()
				.scaledToFit()
				.frame(height: 35)
			
		}
	}
}

struct ExchangeRate_Previews: PreviewProvider {
	static var previews: some View {
		ExchangeRate(leftImage: "goldpiece", text: "1 Gold Piece = 4 Gold Pennies", rightImage: "goldpenny")
			.previewLayout(.sizeThatFits)
	}
}
