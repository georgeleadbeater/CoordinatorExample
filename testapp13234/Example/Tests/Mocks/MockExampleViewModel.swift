@testable import testapp13234

class MockExampleViewModel {
    // MARK: - Properties
    
    var view: ExampleViewProtocol?
    var coordinator: ExampleCoordinatorProtocol = MockExampleCoordinator()
    
    // MARK: - Test Properties

    var didTapExampleButtonCalled = false
}

// MARK: - ExampleViewModelProtocol

extension MockExampleViewModel: ExampleViewModelProtocol {
    func didTapExampleButton() {
        didTapExampleButtonCalled = true
    }
}
