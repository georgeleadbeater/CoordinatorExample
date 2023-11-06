@testable import testapp13234
import XCTest

class ExampleCoordinatorTests: XCTestCase {
    // MARK: - Properties
    
    var coordinator: ExampleCoordinator!
    var viewController: MockViewController!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        viewController = MockViewController()
        coordinator = ExampleCoordinator()
        coordinator.viewController = viewController
    }
    
    // MARK: - Test Methods
    
    func testThatNavigateToExampleCompletes() {
        coordinator.navigateToExample()
        
        XCTAssertTrue(viewController.pushCalled)
        XCTAssertTrue(viewController.destinationViewController is ExampleViewController)
    }
}
