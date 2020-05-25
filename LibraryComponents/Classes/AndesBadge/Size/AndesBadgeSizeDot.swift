//
//  AndesBadgeSizeDot.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/14/20.
//

internal struct AndesBadgeSizeDot: AndesBadgeSizeProtocol {

    public var font: UIFont = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 12)

    public var lineSpacing: CGFloat = 1

    public var height: CGFloat = 8

    public var borderRadius: CGFloat = 4

    public var verticalPadding: CGFloat = 0

    public var horizontalPadding: CGFloat = 0
}
