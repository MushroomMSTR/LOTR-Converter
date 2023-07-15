//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct SelectCurrency: View {
	
	@Environment(\.dismiss) var dismiss
	@Binding var leftCurrency: Currency
	@Binding var rightCurrency: Currency
	
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
				IconGrid(currency: $leftCurrency)
				
				// Text
				Text("Select the currency you would like to convert:")
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
				
				// Currency Icon
				IconGrid(currency: $rightCurrency)
				
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
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
		SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
