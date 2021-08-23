//
//  Helpers.swift
//  Buttery
//
//  Created by Jonathan Holland on 8/7/21.
//

import SwiftUI

@available(iOS 13, macOS 10.15, tvOS 13, watchOS 6, *)
public extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(1))
    }
}

@available(iOS 13, macOS 10.15, tvOS 13, watchOS 6, *)
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

public func mag(of values: [Double]) -> Double {
    return (values.max() ?? 0) - (values.min() ?? 0)
}
public func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

public func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double> where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

#if os(iOS)
import UIKit

@available(iOS 10, *)
public class HapticFeedback {
    #if os(watchOS)
    //watchOS implementation
    public static func playSelection() -> Void {
        WKInterfaceDevice.current().play(.click)
    }
    #elseif os(iOS)
    //iOS implementation
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    public static func playSelection() -> Void {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    #endif
}

#endif
