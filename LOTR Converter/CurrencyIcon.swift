//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct CurrencyIcon: View {
	
	@State var currencyImage: String
	@State var currencyText: String
	@State var currencyRarity: Color
	
    var body: some View {
		ZStack {
			// Currency Image
			Image(currencyImage)
				.resizable()
				.scaledToFit()
			
			// Currency Text
			VStack {
				Spacer()
				Text(currencyText)
					.padding(3)
					.font(.caption)
				.background(currencyRarity.opacity(0.75))
			}
		}
		.padding(3)
		.frame(width: 100, height: 100)
		.background(currencyRarity)
		.cornerRadius(25)    }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
		CurrencyIcon(currencyImage: "copperpenny", currencyText: "Copper Penny", currencyRarity: .brown)
			.previewLayout(.sizeThatFits)
    }
}
