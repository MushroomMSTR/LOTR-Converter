//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import SwiftUI

struct IconGrid: View {
	
	@State var gridLayout = [GridItem(), GridItem(), GridItem()]
	@Binding var currency: Currency
	
	var body: some View {
		LazyVGrid(columns: gridLayout) {
			ForEach(0..<5) { i in
				if Currency.allCases[i] == currency {
					CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue,
								 currencyText: CurrencyText.allCases[i].rawValue,
								 materialColor: getMaterialColor(from: CurrencyText.allCases[i]))
					.overlay(RoundedRectangle(cornerRadius: 25)
						.stroke(lineWidth: 3)
						.opacity(0.5))
					.shadow(color: .black, radius: 7)
				} else {
					CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue,
								 currencyText: CurrencyText.allCases[i].rawValue,
								 materialColor: getMaterialColor(from: CurrencyText.allCases[i]))
					.onTapGesture {
						currency = Currency.allCases[i]
					}
				}
				
			}
		}
		.padding([.bottom, .leading, .trailing])
	}
}

struct IconGrid_Previews: PreviewProvider {
	static var previews: some View {
		IconGrid(currency: .constant(.silverPiece))
	}
}

