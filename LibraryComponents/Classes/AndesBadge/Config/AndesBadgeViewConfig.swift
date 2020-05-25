//
//  AndesBadgeViewConfig.swift
//  AndesUI
//

import Foundation

/// used to define the ui of internal AndesBadge views
internal struct AndesBadgeViewConfig {

    var backgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor

    var height: CGFloat?
    var verticalPadding: CGFloat?
    var horizontalPadding: CGFloat?

    var text: String? = "Label"
    var textStyle: AndesFontStyle?

    var icon: String?
    var iconColor: UIColor?
    var iconBackgroundColor: UIColor?

    var cornerRadius: CGFloat = 6.0
    var roundedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

    init() {}

    init(backgroundColor: UIColor, text: String, sizeStyle: AndesBadgeSizeProtocol, textColor: UIColor, roundedCorners: CACornerMask) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = sizeStyle.borderRadius
        self.height = sizeStyle.height
        self.verticalPadding = sizeStyle.verticalPadding
        self.horizontalPadding = sizeStyle.horizontalPadding
        self.textStyle = AndesFontStyle(textColor: textColor, font: sizeStyle.font, lineSpacing: sizeStyle.lineSpacing)
        self.text = text
        self.roundedCorners = roundedCorners
    }

    init(backgroundColor: UIColor, text: String, sizeStyle: AndesBadgeSizeProtocol, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = sizeStyle.borderRadius
        self.height = sizeStyle.height
        self.verticalPadding = sizeStyle.verticalPadding
        self.horizontalPadding = sizeStyle.horizontalPadding
        self.textStyle = AndesFontStyle(textColor: textColor, font: sizeStyle.font, lineSpacing: sizeStyle.lineSpacing)
        self.text = text
    }
}
