@testable import testapp13234
import XCTest

class ExampleViewModelTests: XCTestCase {
    // MARK: - Properties
    
    var viewModel: ExampleViewModel!
    var view: MockExampleView!
    var coordinator: MockExampleCoordinator!
    var exampleRepository: MockExampleRepository!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        view = MockExampleView()
        coordinator = MockExampleCoordinator()
        viewModel = ExampleViewModel(view: view,
                                     coordinator: coordinator)
        exampleRepository = MockExampleRepository()
        viewModel.exampleRepository = exampleRepository
    }
    
    // MARK: - Test Methods
    
    func testThatViewDidLoadCallsView() {
        viewModel.viewDidLoad()
        
        XCTAssertTrue(view.configureCalled)
    }
    
    func testThatDidTapExampleButtonCompletesAllActions() {
        viewModel.didTapExampleButton()
        
        XCTAssertTrue(exampleRepository.exampleCalled)
        XCTAssertTrue(coordinator.navigateToExampleCalled)
    }
}
