//
//  AndesBadgeTests.swift
//  AndesUI_Tests
//

import Quick
import Nimble
@testable import AndesUI

class AndesBadgeTests: QuickSpec {
    override func spec() {
        describe("AndesBadge should draw its view depending on modifier, type, and hierarchy") {
            context("Badge Modifier: Pill") {
                it("A Badge by default should be a neutral, loud, large, standard bordered Pill") {
                    // Given
                    let defaultHierarchy = AndesBadgeHierarchy.loud
                    let defaultType = AndesBadgeType.neutral
                    let defaultSize = AndesBadgeSize.large
                    let defaultBorder = AndesBadgeBorder.standard

                    // When
                    let badge = AndesBadgePill(frame: .zero)

                    // Then
                    expect(badge.hierarchy).to(equal(defaultHierarchy))
                    expect(badge.type).to(equal(defaultType))
                    expect(badge.size).to(equal(defaultSize))
                    expect(badge.border).to(equal(defaultBorder))
                    expect(badge.contentView.isKind(of: AndesBadgeViewPill.self)).to(beTrue())
                }

                it("Andes Badge with custom hierarchy, type, text, and border") {
                    //Given
                    let hierarchy = AndesBadgeHierarchy.quiet
                    let type = AndesBadgeType.success
                    let size = AndesBadgeSize.small
                    let border = AndesBadgeBorder.rounded
                    let text = "Pill text"

                    //When
                    let badge = AndesBadgePill(hierarchy: hierarchy, type: type, border: border, size: size, text: text)

                    //Then
                    let contentView = badge.contentView as! AndesBadgeViewPill
                    expect(contentView.isKind(of: AndesBadgeViewPill.self)).to(beTrue())

                    let sizeStyle = AndesBadgeSizeSmall()
                    expect(contentView.heightConstraint.constant).to(equal(sizeStyle.height))
                    expect(contentView.top.constant).to(equal(sizeStyle.verticalPadding))
                    expect(contentView.bottom.constant).to(equal(sizeStyle.verticalPadding))
                    expect(contentView.left.constant).to(equal(sizeStyle.horizontalPadding))
                    expect(contentView.right.constant).to(equal(sizeStyle.horizontalPadding))

                    let hierarchyStyle = AndesBadgeHierarchyQuiet(type: AndesBadgeTypeSuccess())
                    expect(contentView.textLabel.text).to(match(text))
                    expect(contentView.textLabel.textColor).to(equal(hierarchyStyle.textColor))
                    expect(contentView.backgroundColor).to(equal(hierarchyStyle.backgroundColor))

                    if #available(iOS 11.0, *) {
                        expect(contentView.layer.maskedCorners).to(equal(AndesBadgeBorderRounded().corners))
                    }
                    expect(contentView.layer.cornerRadius).to(equal(AndesBadgeSizeSmall().borderRadius))
                }
            }

            context("Badge Modifier: Dot") {
                it("A Badge Dot by default should be neutral") {
                    // Given
                    let defaultType = AndesBadgeType.neutral

                    // When
                    let badge = AndesBadgeDot(frame: .zero)

                    // Then
                    expect(badge.type).to(equal(defaultType))
                }
                it("Set the right type when is custom") {
                    // Given
                    let highlightType = AndesBadgeType.highlight

                    // When
                    let badge = AndesBadgeDot(frame: .zero)
                    badge.type = highlightType

                    // Then
                    expect(badge.type).to(equal(highlightType))
                }
            }

        }
        describe("AndesBadge should be able to change its UI dinamically") {
            context("AndesBadgePill view") {
                var badge: AndesBadgePill = AndesBadgePill(frame: .zero)
                var contentView: AndesBadgeViewPill = badge.contentView as! AndesBadgeViewPill

                beforeEach {
                    badge = AndesBadgePill(frame: .zero)
                    contentView = badge.contentView as! AndesBadgeViewPill
                }

                it("changes badge hierarchy dinamycally") {
                    //Given
                    badge.text = "Text"
                    let hierarchyToChange: AndesBadgeHierarchy = .quiet

                    //When
                    badge.hierarchy = hierarchyToChange

                    //Then
                    let hierarchyStyle = AndesBadgeHierarchyQuiet(type: AndesBadgeTypeNeutral())
                    expect(contentView.textLabel.textColor).to(equal(hierarchyStyle.textColor))
                    expect(contentView.backgroundColor).to(equal(hierarchyStyle.backgroundColor))
                }

                it("changes badge type dinamycally") {
                    //Given
                    let typeToChange: AndesBadgeType = .success

                    //When
                    badge.type = typeToChange

                    //Then
                    let hierarchyStyle = AndesBadgeHierarchyLoud(type: AndesBadgeTypeSuccess())
                    expect(contentView.textLabel.textColor).to(equal(hierarchyStyle.textColor))
                    expect(contentView.backgroundColor).to(equal(hierarchyStyle.backgroundColor))
                }

                it("changes badge size dinamycally") {
                    //Given
                    let sizeToChange: AndesBadgeSize = .small

                    //When
                    badge.size = sizeToChange

                    //Then
                    let sizeStyle = AndesBadgeSizeSmall()
                    expect(contentView.heightConstraint.constant).to(equal(sizeStyle.height))
                    expect(contentView.top.constant).to(equal(sizeStyle.verticalPadding))
                    expect(contentView.bottom.constant).to(equal(sizeStyle.verticalPadding))
                    expect(contentView.left.constant).to(equal(sizeStyle.horizontalPadding))
                    expect(contentView.right.constant).to(equal(sizeStyle.horizontalPadding))
                }
            }

            context("AndesBadgeDot view") {
                var badge: AndesBadgeDot = AndesBadgeDot(frame: .zero)
                var contentView: AndesBadgeViewDot = badge.contentView as! AndesBadgeViewDot

                beforeEach {
                    badge = AndesBadgeDot(frame: .zero)
                    contentView = badge.contentView as! AndesBadgeViewDot
                }

                it("changes badge type dinamycally") {
                    //Given
                    let typeToChange: AndesBadgeType = .success

                    //When
                    badge.type = typeToChange

                    //Then
                    expect(contentView.backgroundColor).to(equal(AndesBadgeTypeFactory.provide(typeToChange).primaryColor))
                }
            }
        }
    }
}
