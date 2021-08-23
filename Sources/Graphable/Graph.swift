//
//  Graph.swift
//  Buttery
//
//  Created by Jonathan Holland on 8/7/21.
//

import SwiftUI

@available(iOS 13.0, macOS 11, *)
public struct Graph: Graphable {
    /// (Title, Range of Double values to be displayed, Color)
    public var data: [(String, Range<Double>, Color)]
    /// (Title, Range of Double values to be displayed, Color)
    public var subGraphData: [(String, Range<Double>, Color)]?
    
    public var touchLocation: CGFloat
    public var showSubGraph: Bool
    
    public var minWidth: CGFloat?
    public var minHeight: CGFloat?
    public var maxWidth: CGFloat?
    public var maxHeight: CGFloat?
    
    public init(data: [(String, Range<Double>, Color)], subGraphData: [(String, Range<Double>, Color)]? = nil, touchLocation: CGFloat, showSubGraph: Bool = false, minWidth: CGFloat? = nil, minHeight: CGFloat? = nil, maxWidth: CGFloat? = nil, maxHeight: CGFloat? = nil) {
        self.data = data
        self.subGraphData = subGraphData
        self.touchLocation = touchLocation
        self.showSubGraph = showSubGraph
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }
        
    @State private var showValue: Bool = false
    @State private var showLabelValue: Bool = false
    @State private var currentValue: Range<Double> = 0..<0 {
        didSet{
            if(oldValue != self.currentValue && self.showValue) {
                #if os(iOS)
                HapticFeedback.playSelection()
                #endif
            }
        }
    }
    
    var range: Range<Double> {
        rangeOfRanges(data.lazy.map { $0.1 })
    }
    var maxMagnitude: Double {
        data.map { magnitude(of: $0.1) }.max()!
    }
    var heightRatio: CGFloat {
        1 - CGFloat(maxMagnitude / magnitude(of: range))
    }
    
    var subGraphRange: Range<Double> {
        rangeOfRanges(data.lazy.map { $0.1 })
    }
    var subGraphMaxMagnitude: Double {
        data.map { magnitude(of: $0.1) }.max()!
    }
    var subGraphHeightRatio: CGFloat {
        1 - CGFloat(maxMagnitude / magnitude(of: range))
    }
    
    @ViewBuilder
    func candle() -> some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                    ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                        CandleCapsule(index: index, height: proxy.size.height, range: value.1, overallRange: range)
                            .colorMultiply(value.2)
                            .transition(.slide)
                            .animation(.ripple(index: index))
                            .scaleEffect(self.touchLocation > CGFloat(index)/CGFloat(self.data.count) && self.touchLocation < CGFloat(index+1)/CGFloat(self.data.count) ? CGSize(width: 1.4, height: 1.1) : CGSize(width: 1, height: 1), anchor: .bottom)
                    }
                    .offset(x: 0, y: proxy.size.height * heightRatio)
                }
                .frame(minWidth: proxy.size.width, minHeight: proxy.size.height + (proxy.size.height * heightRatio), maxHeight: .infinity)
                if showSubGraph {
                    HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                        ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                            SubGraphCapsule(index: index, height: proxy.size.height, range: value.1, overallRange: subGraphRange)
                                .colorMultiply(value.2)
                                .transition(.slide)
                                .animation(.ripple(index: index))
                                .scaleEffect(self.touchLocation > CGFloat(index)/CGFloat(self.data.count) && self.touchLocation < CGFloat(index+1)/CGFloat(self.data.count) ? CGSize(width: 0.5, height: 0.5) : CGSize(width: 0.25, height: 0.25), anchor: .bottom)
                        }
                        .offset(x: 0, y: (proxy.size.height * subGraphHeightRatio) - (proxy.size.height * heightRatio))
                    }.frame(minWidth: proxy.size.width, minHeight: proxy.size.height + (proxy.size.height * subGraphHeightRatio), maxHeight: .infinity)
                }
            }
            .frame(minWidth: minWidth ?? proxy.size.width, maxWidth: maxWidth ?? nil, minHeight: minHeight ?? proxy.size.height + (proxy.size.height * heightRatio) + ((proxy.size.height * subGraphHeightRatio)*2), maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    func horizontal() -> some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: proxy.size.width / 120) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                    HCapsule(width: proxy.size.width, range: value.1, overallRange: range)
                        .colorMultiply(value.2)
                        .transition(.slide)
                        .animation(.ripple(index: index))
                        .scaleEffect(self.touchLocation > CGFloat(index)/CGFloat(data.count) && self.touchLocation < CGFloat(index+1)/CGFloat(data.count) ? CGSize(width: 1.4, height: 1.1) : CGSize(width: 1, height: 1), anchor: .leading)
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }.frame(minWidth: minWidth ?? proxy.size.width, maxWidth: maxWidth ?? nil, minHeight: minHeight ?? proxy.size.height + (proxy.size.height * heightRatio) + ((proxy.size.height * subGraphHeightRatio)*2), maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    func vertical() -> some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: proxy.size.width / 120) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                    VCapsule(height: proxy.size.height, range: value.1, overallRange: range)
                        .colorMultiply(value.2)
                        .transition(.slide)
                        .animation(.ripple(index: index))
                        .scaleEffect(self.touchLocation > CGFloat(index)/CGFloat(data.count) && self.touchLocation < CGFloat(index+1)/CGFloat(data.count) ? CGSize(width: 1.4, height: 1.1) : CGSize(width: 1, height: 1), anchor: .leading)
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }.frame(minWidth: minWidth ?? proxy.size.width, maxWidth: maxWidth ?? nil, minHeight: minHeight ?? proxy.size.height + (proxy.size.height * heightRatio) + ((proxy.size.height * subGraphHeightRatio)*2), maxHeight: .infinity)
        }
    }
    
}


