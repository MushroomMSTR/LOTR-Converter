//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by NazarStf on 14.07.2023.
//

import SwiftUI

struct ExchangeInfo: View {
    var body: some View {
		ZStack {
			// Back
			Image("parchment")
				.resizable()
				.ignoresSafeArea()
				.background(.brown)
			VStack {
				// Title
				Text("Exchange Rates")
					.font(.largeTitle)
				// Body
				Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
					.font(.title2)
				
				// Exchange rates
				HStack {
					// Left
					Image("goldpiece")
						.resizable()
						.scaledToFit()
						.frame(height: 35)
					// Exchange rate text
					Text("1 Gold Piece = 4 Gold Pennies")
					
					// Right
					Image("goldpenny")
						.resizable()
						.scaledToFit()
						.frame(height: 35)
				}
				
				// Done button
			}
			
		}
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}
