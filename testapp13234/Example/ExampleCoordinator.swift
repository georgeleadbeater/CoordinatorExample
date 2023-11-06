import UIKit

class ExampleCoordinator {
    weak var viewController: UIViewController?
}

// MARK: - ExampleCoordinatorProtocol

extension ExampleCoordinator: ExampleCoordinatorProtocol {
    func navigateToExample() {
        let module = ExampleModule.build()
        viewController?.navigationController?.pushViewController(module, animated: true)
    }
}
