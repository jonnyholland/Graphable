    import XCTest
    @testable import Graphable

    final class GraphableTests: XCTestCase {
        
        var sut: Graph!
        var app: XCUIApplication!
        
        override func setUpWithError() throws {
            try super.setUpWithError()
            sut = .init(data: Graph.testData, touchLocation: 0, showSubGraph: false)
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch()
        }
        override func tearDown() {
            sut = nil
            super.tearDown()
        }
    }
