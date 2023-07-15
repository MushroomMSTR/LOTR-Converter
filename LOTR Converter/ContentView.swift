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
	@State var leftAmountTemp = ""
	@State var rightAmountTemp = ""
	@State var leftTyping = false
	@State var rightTyping = false
	@State var leftCurrency: Currency = .silverPiece
	@State var rightCurrency: Currency = .goldPiece
	@State var showSelectCurrency = false
	@State var showExchangeInfo = false
	
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
						.onTapGesture {
							showSelectCurrency.toggle()
						}
						.sheet(isPresented: $showSelectCurrency) {
							SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
						}
						// Text field
						TextField("Amount", text: $leftAmount, onEditingChanged: { typing in
							leftTyping = typing
							leftAmountTemp = leftAmount
						})
						.padding(7)
						.background(Color(UIColor.systemGray6))
						.cornerRadius(7)
						.keyboardType(.decimalPad)
						// For leftAmount
						.onChange(of: leftTyping ? leftAmount : leftAmountTemp) { _ in
							if !rightTyping {
								rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
							}
						}
						.onChange(of: leftCurrency) { _ in
							leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
						}
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
						.onTapGesture {
							showSelectCurrency.toggle()
						}
						.sheet(isPresented: $showSelectCurrency) {
							SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
						}
						// Text field
						TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
							rightTyping = typing
							rightAmountTemp = rightAmount
						})
						.padding(7)
						.background(Color(UIColor.systemGray6))
						.cornerRadius(7)
						.multilineTextAlignment(.trailing)
						.keyboardType(.decimalPad)
						// For rightAmount
						.onChange(of: rightTyping ? rightAmount : rightAmountTemp) { _ in
							if !leftTyping {
								leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
							}
						}
						.onChange(of: rightCurrency) { _ in
							rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
						}
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
						showExchangeInfo.toggle()
					} label: {
						Image(systemName: "info.circle.fill")
					}
					.font(.largeTitle)
					.foregroundColor(.white)
					.padding(.trailing)
					.sheet(isPresented: $showExchangeInfo) {
						ExchangeInfo()
					}
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
