//
//  CustomFont.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import SwiftUI

// MARK: - Custom Font View Modifier
// This struct is a ViewModifier which allows to apply a custom font with a specific text style
struct CustomFont: ViewModifier {
	
	// Environment variable for current size category
	@Environment(\.sizeCategory) var sizeCategory

	// Name of the custom font
	var name: String
	
	// Text style to be used with the font
	var style: UIFont.TextStyle

	// MARK: - Body for View Modifier
	// Defines how to modify the content view
	func body(content: Content) -> some View {
		
		// Calculate scaled size for the given text style
		let scaledSize = UIFontMetrics.default.scaledValue(for: baseSize(for: style))
		
		// Apply custom font with scaled size to the content view
		return content.font(.custom(name, size: scaledSize))
	}

	// MARK: - Base Size Calculation
	// This function returns the base size for a given text style
	private func baseSize(for style: UIFont.TextStyle) -> CGFloat {
		switch style {
		case .largeTitle: return 34
		case .title1: return 28
		case .title2: return 22
		case .title3: return 20
		case .headline: return 17
		case .body: return 17
		case .callout: return 16
		case .subheadline: return 15
		case .footnote: return 13
		case .caption1: return 12
		case .caption2: return 11
		default: return 17
		}
	}
}

// MARK: - View Extension for Custom Font
// This extension adds a customFont() modifier to all Views
extension View {
	func customFont(name: String, style: UIFont.TextStyle) -> some View {
		
		// Use the CustomFont ViewModifier with the given font name and style
		self.modifier(CustomFont(name: name, style: style))
	}
}
