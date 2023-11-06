import Combine
import Foundation

// MARK: - ExampleDelegate

protocol ExampleDelegate: AnyObject {
    func didExample()
}

class ExampleViewModel: ErrorProtocol {
    // MARK: - ExampleViewProtocol
    
    weak var view: ExampleViewProtocol?
    var coordinator: ExampleCoordinatorProtocol
    
    // MARK: - Properties
    
    var exampleRepository: ExampleRepositoryProtocol = ExampleRepository()
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Lifecycle

    init(view: ExampleViewProtocol, coordinator: ExampleCoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
    }
    
    // MARK: - Private Methods
    
    private func exampleRequest() {
        exampleRepository.example()
            .sink { [weak self] completion in
                switch completion {
                case .finished: break
                case .failure(let error): self?.displayAndReportError(error)
                }
            } receiveValue: { [weak self] _ in
                self?.coordinator.navigateToExample()
            }.store(in: &subscriptions)
    }
}

// MARK: - ExampleViewModelProtocol

extension ExampleViewModel: ExampleViewModelProtocol {
    func viewDidLoad() {
        view?.configure()
    }
    
    func didTapExampleButton() {
        exampleRequest()
    }
}
