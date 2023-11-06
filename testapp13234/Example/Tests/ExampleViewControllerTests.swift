@testable import testapp13234
import XCTest

class ExampleViewControllerTests: XCTestCase {
    // MARK: - Properties
    
    var view: ExampleViewController!
    var viewModel: MockExampleViewModel!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        view = ExampleViewController()
        view.loadViewIfNeeded()
        viewModel = MockExampleViewModel()
        view.viewModel = viewModel
    }
    
    // MARK: - Test Methods
    
    func testThatConfigureCompletesAllActions() {
        view.configure()
        
        XCTAssertTrue(view.exampleView.delegate === view)
        XCTAssertTrue(view.exampleView.tableView.delegate === view)
        XCTAssertTrue(view.exampleView.isDescendant(of: view.view))
    }
    
    func testThatDidTapExampleButtonCallsViewModel() {
        view.didTapExampleButton()
        
        XCTAssertTrue(viewModel.didTapExampleButtonCalled)
    }
}
