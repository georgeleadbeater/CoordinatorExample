import SnapKit
import UIKit

class ExampleViewController: UIViewController {
    // MARK: - ExampleViewProtocol
    
    var viewModel: ExampleViewModelProtocol?
    
    // MARK: - UI Elements
    
    let exampleView = ExampleView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
}

// MARK: - ExampleViewProtocol

extension ExampleViewController: ExampleViewProtocol {
    func configure() {
        exampleView.delegate = self
        exampleView.tableView.delegate = self
        view.addSubview(exampleView)
        exampleView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

// MARK: - UITableViewDelegate

extension ExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Selected row
    }
}

// MARK: - ExampleViewDelegate

extension ExampleViewController: ExampleViewDelegate {
    func didTapExampleButton() {
        viewModel?.didTapExampleButton()
    }
}
