//
//  ContentView.swift
//  LOTR Converter
//
//  Created by NazarStf on 10.07.2023.
//

import SwiftUI

struct ContentView: View {
	
	// MARK: - State Variables for Holding User Input and Currency Choices
	@State var leftAmount = ""
	@State var rightAmount = ""
	@State var leftAmountTemp = ""
	@State var rightAmountTemp = ""
	@State var leftTyping = false
	@State var rightTyping = false
	@State var leftCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "LeftCurrency")) ?? .silverPiece
	@State var rightCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "RightCurrency")) ?? .goldPiece
	@State var showSelectCurrency = false
	@State var showExchangeInfo = false
	
	// MARK: - Main User Interface
	var body: some View {
		// Using a ZStack allows overlaying views on top of each other
		ZStack {
			// The background image
			Image("background")
				.resizable()
				.ignoresSafeArea()

			// The main content of the view
			VStack {
				// Display the logo for the app
				Image("prancingpony")
					.resizable()
					.scaledToFit()
					.frame(height: 200)

				// Display a title for the app
				Text("Currency Exchange")
					.customFont(name: "Ringbearer", style: .largeTitle)
					.foregroundColor(.white)

				// Display the currency conversion section
				HStack {
					// Display the left currency section
					VStack {
						// Display the left currency name and image
						HStack {
							Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
								.resizable()
								.scaledToFit()
								.frame(height: 35)
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
						// Additional views and logic for the left currency section
						.onChange(of: leftTyping ? leftAmount : leftAmountTemp) { _ in
							if !rightTyping {
								rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
							}
						}
						.onChange(of: leftCurrency) { _ in
							leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
							UserDefaults.standard.set(leftCurrency.rawValue, forKey: "LeftCurrency")
						}
					}
					
					// Display the equals sign
					Image(systemName: "equal")
						.font(.largeTitle)
						.foregroundColor(.white)
					// Display the right currency section
					VStack {
						// Display the right currency name and image
						HStack {
							Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
								.font(.headline)
								.foregroundColor(.white)
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
						// Additional views and logic for the right currency section
						.onChange(of: rightTyping ? rightAmount : rightAmountTemp) { _ in
							if !leftTyping {
								leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
							}
						}
						.onChange(of: rightCurrency) { _ in
							rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
							UserDefaults.standard.set(rightCurrency.rawValue, forKey: "RightCurrency")
						}
					}
				}
				.padding()
				.background(.black.opacity(0.7))
				.cornerRadius(5)
				
				Spacer()
				
				// Info button. Additional views and logic for the main content
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
