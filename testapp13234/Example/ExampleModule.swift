import UIKit

class ExampleModule: ExampleModuleProtocol {
    // MARK: - Lifecycle
    
    private init() { }
    
    // MARK: - Public Methods
    
    static func build() -> UIViewController {
        let view = ExampleViewController()
        let coordinator = ExampleCoordinator()
        let viewModel = ExampleViewModel(view: view,
                                         coordinator: coordinator)

        view.viewModel = viewModel
        coordinator.viewController = view

        return view
    }
}
