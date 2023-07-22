//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct SelectCurrency: View {
	
	// MARK: - Environment Variable for Dismissing the View
	@Environment(\.dismiss) var dismiss

	// MARK: - State Variables for Selected Currencies
	@Binding var leftCurrency: Currency
	@Binding var rightCurrency: Currency
	
	// MARK: - Main User Interface
	var body: some View {
		ZStack {
			// The background image
			Image("parchment")
				.resizable()
				.ignoresSafeArea()
				.background(.brown)
			
			VStack {
				// Display the instruction for choosing the starting currency
				Text("Select the currency you are starting with:")
					.customFont(name: "Ringbearer", style: .title2)
					.multilineTextAlignment(.center)
					.foregroundColor(.black)
				
				// Display the grid of currency icons for choosing the starting currency
				IconGrid(currency: $leftCurrency)
				
				// Display the instruction for choosing the target currency
				Text("Select the currency you would like to convert:")
					.customFont(name: "Ringbearer", style: .title2)
					.multilineTextAlignment(.center)
					.foregroundColor(.black)
				
				// Display the grid of currency icons for choosing the target currency
				IconGrid(currency: $rightCurrency)
				
				// Display the "Done" button which dismisses the view when tapped
				Button("Done") {
					dismiss()
				}
				.customFont(name: "Ringbearer", style: .largeTitle)
				.padding(10)
				.foregroundColor(.white)
				.background(.brown)
				.cornerRadius(20)
			}
		}
	}
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
		SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
