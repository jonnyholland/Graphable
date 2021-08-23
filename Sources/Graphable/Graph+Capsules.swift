//
//  Graph+Capsules.swift
//  Buttery
//
//  Created by Jonathan Holland on 8/7/21.
//

import SwiftUI

@available(iOS 13, macOS 11, tvOS 13, watchOS 6, *)
public extension Graph {
    struct HCapsule: View {
        var width: CGFloat
        var range: Range<Double>
        var overallRange: Range<Double>
        
        var widthRatio: CGFloat {
            max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
        }
        
        var offsetRatio: CGFloat {
            CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
        }
        
        public var body: some View {
            SwiftUI.Capsule()
                .fill(Color.white)
                .frame(width: width * widthRatio)
                .offset(x: 0, y: width * -offsetRatio)
        }
    }
    
    struct VCapsule: View {
        var height: CGFloat
        var range: Range<Double>
        var overallRange: Range<Double>
        
        var heightRatio: CGFloat {
            max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
        }
        
        var offsetRatio: CGFloat {
            CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
        }
        
        public var body: some View {
            SwiftUI.Capsule()
                .fill(Color.white)
                .frame(width: height * heightRatio)
                .offset(x: 0, y: height * -offsetRatio)
        }
    }
    
    struct CandleCapsule: View {
        var index: Int
        var height: CGFloat
        var range: Range<Double>
        var overallRange: Range<Double>
        
        var heightRatio: CGFloat {
            max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
        }
        
        var offsetRatio: CGFloat {
            CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
        }
        
        public var body: some View {
            Capsule()
                .fill(Color.white)
                .frame(height: height * heightRatio)
                .offset(x: 0, y: height * -offsetRatio)
        }
    }
    
    struct SubGraphCapsule: View {
        var index: Int
        var height: CGFloat
        var range: Range<Double>
        var overallRange: Range<Double>
        
        var heightRatio: CGFloat {
            max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
        }
        
        var offsetRatio: CGFloat {
            CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
        }
        
        public var body: some View {
            Capsule()
                .fill(Color.white)
                .frame(height: height * heightRatio)
                .offset(x: 0, y: height * -offsetRatio)
        }
    }
}
