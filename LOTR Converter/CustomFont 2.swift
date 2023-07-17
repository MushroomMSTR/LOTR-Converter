//
//  CustomFont.swift
//  LOTR Converter
//
//  Created by NazarStf on 15.07.2023.
//

import SwiftUI

struct CustomFont: ViewModifier {
	@Environment(\.sizeCategory) var sizeCategory

	var name: String
	var style: UIFont.TextStyle

	func body(content: Content) -> some View {
		let scaledSize = UIFontMetrics.default.scaledValue(for: baseSize(for: style))
		return content.font(.custom(name, size: scaledSize))
	}

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

extension View {
	func customFont(name: String, style: UIFont.TextStyle) -> some View {
		self.modifier(CustomFont(name: name, style: style))
	}
}
