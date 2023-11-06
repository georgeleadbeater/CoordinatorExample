@testable import testapp13234
import UIKit

class MockExampleView {
    // MARK: - Properties
    
    var viewModel: ExampleViewModelProtocol?
    
    // MARK: - Test Properties
    
    var configureCalled = false
}

// MARK: - ExampleViewProtocol

extension MockExampleView: ExampleViewProtocol {
    func configure() {
        configureCalled = true
    }
}
