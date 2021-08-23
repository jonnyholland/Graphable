# Graphable

Easily add beautiful graphs to your project or app.

[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](#swift-package-manager) ![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg) ![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg) ![languages](https://img.shields.io/badge/language-Swift%20%7C%20SwiftUI-lightgrey.svg)

## Getting Started

Simply import WindowMaker into the Swift file you want to use it in, add in the data, call the view you want and Graphable will take care of the rest. 

Some test data is supplied but feel free to extend Graphable with more or add your own. 

## Use
First, you need to add an object to the top. 
````swift
let graph: Graph = .init(data: Graph.testData, touchLocation: 0, showSubGraph: false)
````
Then, simply call the view you want to show. 
````swift
var body: some View {
    VStack {
        graph.candle()
    }
}
````

#### Swift Package Manager

If you use Swift Package Manager, simply add ReactiveSwift as a dependency
of your package in `Package.swift`:

```
.package(url: "https://github.com/jonnyholland/WindowMaker.git", from: "1.0.0")
```
