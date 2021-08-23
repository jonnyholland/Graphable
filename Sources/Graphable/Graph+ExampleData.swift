//
//  Graph+ExampleData.swift
//  
//
//  Created by Jonathan Holland on 8/23/21.
//

import SwiftUI

public extension Graph {
    static var testData: [(String, Range<Double>, Color)] = [
        ("\(Date().description)", 1275..<3895, .accentColor),
        ("", 1260..<3369, .blue),
        ("", 2775..<4588, .red),
        ("MARK", 7661..<12534, .green)
    ]
}
