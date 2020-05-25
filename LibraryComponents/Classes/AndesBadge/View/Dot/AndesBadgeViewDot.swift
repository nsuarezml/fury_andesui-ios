//
//  AndesBadgeViewDot.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/13/20.
//

import Foundation

class AndesBadgeViewDot: AndesBadgeAbstractView {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesBadgeViewDot", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()

        heightConstraint.constant = config.height!

        let cornerRadius = config.cornerRadius
        let roundedCorners = config.roundedCorners

        setCornerRadius(cornerRadius: cornerRadius, roundedCorners: roundedCorners)
    }
}
