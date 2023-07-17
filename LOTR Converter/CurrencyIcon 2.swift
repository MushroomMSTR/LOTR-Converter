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
	@State var materialColor: MaterialColor
	
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
					.customFont(name: "Ringbearer", style: .caption1)
					.background(materialColor.color.opacity(0.75))
			}
		}
		.padding(3)
		.frame(width: 100, height: 100)
		.background(materialColor.color)
		.cornerRadius(25)
	}
}

struct CurrencyIcon_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyIcon(currencyImage: "copperpenny", currencyText: "Copper Penny", materialColor: .bronze)
			.previewLayout(.sizeThatFits)
	}
}
