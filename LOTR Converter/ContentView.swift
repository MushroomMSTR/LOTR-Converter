//
//  ContentView.swift
//  LOTR Converter
//
//  Created by NazarStf on 10.07.2023.
//

import SwiftUI

struct ContentView: View {
	
	@State var leftAmount = ""
	@State var rightAmount = ""
	@State var leftCurrency: Currency = .silverPiece
	@State var rightCurrency: Currency = .goldPiece
	
	
	var body: some View {
		ZStack {
			// Back
			Image("background")
				.resizable()
				.ignoresSafeArea()
			VStack {
				// Prancing pony image
				Image("prancingpony")
					.resizable()
					.scaledToFit()
					.frame(height: 200)
				// Currency exchange text
				Text("Currency Exchange")
					.font(.largeTitle)
					.foregroundColor(.white)
				// Currency conversion section
				HStack {
					// Left
					VStack {
						// Currency
						HStack {
							// Currency Image
							Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
								.resizable()
								.scaledToFit()
								.frame(height: 35)
							// Currency text
							Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
								.font(.headline)
								.foregroundColor(.white)
						}
						.padding(.bottom, -5)
						// Text field
						TextField("Amount", text: $leftAmount)
							.padding(7)
							.background(Color(UIColor.systemGray6))
							.cornerRadius(7)
					}
					
					// "="
					Image(systemName: "equal")
						.font(.largeTitle)
						.foregroundColor(.white)
					// Right
					VStack {
						// Currency
						HStack {
							// Currency text
							Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
								.font(.headline)
								.foregroundColor(.white)
							// Currency Image
							Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
								.resizable()
								.scaledToFit()
								.frame(height: 35)
						}
						.padding(.bottom, -5)
						// Text field
						TextField("Amount", text: $rightAmount)
							.padding(7)
							.background(Color(UIColor.systemGray6))
							.cornerRadius(7)
							.multilineTextAlignment(.trailing)
					}
				}
				.padding()
				.background(.black.opacity(0.7))
				.cornerRadius(5)
				
				Spacer()
				
				// Info button
				HStack {
					Spacer()
					Button {
						// Display exchange info screen
					} label: {
						Image(systemName: "info.circle.fill")
					}
					.font(.largeTitle)
					.foregroundColor(.white)
					.padding(.trailing)
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
