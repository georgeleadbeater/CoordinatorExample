import SnapKit
import UIKit

// MARK: - ExampleViewDelegate

protocol ExampleViewDelegate: AnyObject {
    func didTapExampleButton()
}

// MARK: - ExampleView

class ExampleView: UIView {
    // MARK: - UI Elements
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Example"
        return titleLabel
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExampleCell.self)
        return tableView
    }()
    
    lazy var cancelButton: Button = {
        let cancelButton = Button()
        cancelButton.title = "Example"
        cancelButton.addTarget(self, action: #selector(didTapExampleButton), for: .touchUpInside)
        return cancelButton
    }()
    
    // MARK: - Properties
    
    lazy var dataSource = UITableViewDiffableDataSource
    <Int, String>(tableView: tableView) { tableView, indexPath, _ in
        return tableView.dequeue(ExampleCell.self, indexPath: indexPath)
    }
    
    weak var delegate: ExampleViewDelegate?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        [titleLabel, tableView, exampleButton].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Theme.Spacing.large)
            $0.left.right.equalToSuperview().inset(Theme.Spacing.medium)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Theme.Spacing.mediumLarge)
            $0.left.right.equalToSuperview()
        }
        
        exampleButton.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(Theme.Spacing.mediumLarge)
            $0.left.right.equalToSuperview().inset(Theme.Spacing.medium)
            $0.bottom.equalToSuperview().inset(Theme.Spacing.medium)
        }
    }
    
    @objc private func didTapExampleButton() {
        delegate?.didTapExampleButton()
    }
}
