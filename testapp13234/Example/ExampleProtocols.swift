// swiftlint:disable:this file_name
import Foundation

// MARK: - Coordinator
/// ViewModel -> Coordinator
protocol ExampleCoordinatorProtocol: AnyObject, CoordinatorProtocol {
    func navigateToExample()
}

// MARK: - Module
/// Module -> View
protocol ExampleModuleProtocol: AnyObject {
}

// MARK: - View
/// ViewModel -> ViewController
protocol ExampleViewProtocol: AnyObject {
    var viewModel: ExampleViewModelProtocol? { get set }
    
    func configure()
}

// MARK: - ViewModel
/// ViewController -> ViewModel
protocol ExampleViewModelProtocol: AnyObject, ViewControllerLifecycleProtocol {
    var view: ExampleViewProtocol? { get }
    var coordinator: ExampleCoordinatorProtocol { get }
    
    func didTapExampleButton()
}
