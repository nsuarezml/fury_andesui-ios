//
//  AndesBadge.swift
//  AndesUI
//

import UIKit

@objc public class AndesBadgePill: UIView {
    internal var contentView: AndesBadgeView!

    /// Defines the hierarchy of an AndesBadge
    @objc public var hierarchy: AndesBadgeHierarchy = .loud {
        didSet {
            updateContentView()
        }
    }

    /// Defines the colors/icon of the Badge
    @objc public var type: AndesBadgeType = .neutral {
        didSet {
            updateContentView()
        }
    }

    /// Defines the border style (Pill only)
    @objc public var border: AndesBadgeBorder = .standard {
        didSet {
            updateContentView()
        }
    }

    /// Defines the size of the AndesBadge
    @objc public var size: AndesBadgeSize = .large {
        didSet {
            updateContentView()
        }
    }

    /// Defines the current text (Pill only)
    @IBInspectable public var text: String = "" {
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

    @objc public init(hierarchy: AndesBadgeHierarchy, type: AndesBadgeType, border: AndesBadgeBorder, size: AndesBadgeSize, text: String) {
        super.init(frame: .zero)
        self.hierarchy = hierarchy
        self.type = type
        self.border = border
        self.size = size
        self.text = text
        setup()
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

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func updateContentView() {
        let config = AndesBadgeViewConfigFactory.provideInternalConfig(fromPill: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which Badge modifier is selected
    private func provideView() -> AndesBadgeView {
        let config = AndesBadgeViewConfigFactory.provideInternalConfig(fromPill: self)
        return AndesBadgeViewPill(withConfig: config)
    }
}

// MARK: - Interface Builder properties
public extension AndesBadgePill {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'hierarchy' instead.")
    @IBInspectable var ibHierarchy: String {
        set(val) {
            self.hierarchy = AndesBadgeHierarchy.checkValidEnum(property: "IB Hierarchy", key: val)
        }
        get {
            return self.hierarchy.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = AndesBadgeType.checkValidEnum(property: "IB Type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'border' instead.")
    @IBInspectable var ibBorder: String {
        set(val) {
            self.border = AndesBadgeBorder.checkValidEnum(property: "IB Border", key: val)
        }
        get {
            return self.border.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'size' instead.")
    @IBInspectable var ibSize: String {
        set(val) {
            self.size = AndesBadgeSize.checkValidEnum(property: "IB Size", key: val)
        }
        get {
            return self.size.toString()
        }
    }
}
