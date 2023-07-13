//
//  ContentView.swift
//  LOTR Converter
//
//  Created by NazarStf on 10.07.2023.
//

import SwiftUI

struct ContentView: View {
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
							Image("silverpiece")
								.resizable()
								.scaledToFit()
								.frame(height: 33)
							// Currency text
							Text("Silver Piece")
								.font(.headline)
								.foregroundColor(.white)
						}
						// Text field
						Text("Text field")
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
							Text("Gold Piece")
								.font(.headline)
								.foregroundColor(.white)
							// Currency Image
							Image("goldpiece")
								.resizable()
								.scaledToFit()
								.frame(height: 33)
						}
						// Text field
						Text("Text field")
					}
				}
				
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
					.padding(.trailing, 5)
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
