//
//  AndesBadgeViewPill.swift
//  AndesUI
//

import Foundation

class AndesBadgeViewPill: AndesBadgeAbstractView {
    @IBOutlet weak var textLabel: UILabel!

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    @IBOutlet weak var left: NSLayoutConstraint!
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var right: NSLayoutConstraint!

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesBadgeViewPill", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()

        textLabel.setAndesStyle(style: config.textStyle!)
        textLabel.text = config.text

        heightConstraint.constant = config.height!
        left.constant = config.horizontalPadding!
        right.constant = config.horizontalPadding!
        bottom.constant = config.verticalPadding!
        top.constant = config.verticalPadding!

        let cornerRadius = config.cornerRadius
        let roundedCorners = config.roundedCorners

        self.setCornerRadius(cornerRadius: cornerRadius, roundedCorners: roundedCorners)
    }
}
