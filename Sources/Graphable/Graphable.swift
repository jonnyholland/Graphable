//
//  Graphable.swift
//  
//
//  Created by Jonathan Holland on 8/23/21.
//

import SwiftUI

@available(iOS 13, macOS 10.15, tvOS 13, watchOS 6, *)
public protocol Graphable {
    var data: [(String, Range<Double>, Color)] { get set }
    var subGraphData: [(String, Range<Double>, Color)]? { get set }
    var minWidth: CGFloat? { get set }
    var minHeight: CGFloat? { get set }
    var maxWidth: CGFloat? { get set }
    var maxHeight: CGFloat? { get set }
    
    var touchLocation: CGFloat { get set }
    var showSubGraph: Bool { get set }
}
