//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct SelectCurrency: View {
	
	@State var gridLayout = [GridItem(), GridItem(), GridItem()]
	@Environment(\.dismiss) var dismiss

	var body: some View {
		ZStack {
			// Back
			Image("parchment")
				.resizable()
				.ignoresSafeArea()
				.background(.brown)
			
			VStack {
				// Text
				Text("Select the currency you are starting with:")
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
				// Currency Icon
				LazyVGrid(columns: gridLayout) {
					ForEach(0..<5) { i in
						CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue,
									 currencyText: CurrencyText.allCases[i].rawValue,
									 materialColor: getMaterialColor(from: CurrencyText.allCases[i]))
					}
				}
				// Text
				Text("Select the currency you would like to convert:")
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)

				// Done button
				Button("Done") {
					dismiss()
				}
				.font(.largeTitle)
				.padding(10)
				.foregroundColor(.white)
				.background(.brown)
				.cornerRadius(20)
			}
		}
	}
	
	// Function to return the MaterialColor from the CurrencyText
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
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency()
    }
}