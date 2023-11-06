@testable import testapp13234
import XCTest

class ExampleModuleTests: XCTestCase {
    // MARK: - Properties
    
    var viewController: UIViewController!
    
    // MARK: - Lifecycle

    override func setUp() {
        viewController = ExampleModule.build()
    }
    
    // MARK: - Test Methods
    
    func testView() throws {
        let view = try XCTUnwrap(viewController as? ExampleViewController)
        
        XCTAssertNotNil(view.viewModel as? ExampleViewModel)
    }
    
    func testViewModel() throws {
        let view = try XCTUnwrap(viewController as? ExampleViewController)
        let viewModel = try XCTUnwrap(view.viewModel as? ExampleViewModel)
        let coordinator = try XCTUnwrap(viewModel.coordinator as? ExampleCoordinator)
        
        let viewModelView = try XCTUnwrap(viewModel.view as? ExampleViewController)
        let viewModelCoordinator = try XCTUnwrap(viewModel.coordinator as? ExampleCoordinator)
        
        XCTAssertEqual(view, viewModelView)
        XCTAssertTrue(coordinator === viewModelCoordinator)
    }
    
    func testCoordinator() throws {
        let view = try XCTUnwrap(viewController as? ExampleViewController)
        let viewModel = try XCTUnwrap(view.viewModel as? ExampleViewModel)
        let coordinator = try XCTUnwrap(viewModel.coordinator as? ExampleCoordinator)
        
        XCTAssertEqual(coordinator.viewController, view)
    }
}
