@testable import testapp13234
import UIKit

class MockExampleCoordinator {
    // MARK: - Properties
    
    var viewController: UIViewController?
    
    // MARK: - Test Properties
    
    var navigateToExampleCalled = false
}

// MARK: - ExampleCoordinatorProtocol

extension MockExampleCoordinator: ExampleCoordinatorProtocol {
    func navigateToExample() {
        navigateToExampleCalled = true
    }
}
