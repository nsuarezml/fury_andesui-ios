//
//  AndesBadgeDot.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/13/20.
//

import Foundation

@objc public class AndesBadgeDot: UIView {

    internal var contentView: AndesBadgeView!

    /// Defines the colors/icon of the Badge Dot
    @objc public var type: AndesBadgeType = .neutral {
        didSet {
            updateContentView()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(type: AndesBadgeType) {
        super.init(frame: .zero)
        self.type = type
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: AndesBadgeView) {
        self.contentView = newView
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func updateContentView() {
        let config = AndesBadgeViewConfigFactory.provideInternalConfig(fromDot: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which Badge modifier is selected
    private func provideView() -> AndesBadgeView {
        let config = AndesBadgeViewConfigFactory.provideInternalConfig(fromDot: self)
        return AndesBadgeViewDot(withConfig: config)
    }
}
