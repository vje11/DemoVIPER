//
//  UniversityListingViewController.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//  
//

import UIKit
import UIComponents
import Core

final class UniversityListingViewController: BaseViewController, UniversityListingViewInput {

    // MARK: - Properties

    var presenter: UniversityListingViewOutput!
    
    private lazy var displayedList = [UniversityListTableViewCellViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Views
    private lazy var tableView: UITableView = UITableView().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView(frame: .zero)
        $0.rowHeight = UITableView.automaticDimension
        $0.setContentHuggingPriority(.defaultHigh, for: .vertical)
        $0.registerClass(cellType: UniversityListTableViewCell.self)
    }

    // MARK: - ViewController Lifecycle

    override func loadView() {
        super.loadView()
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Universities"
        setupOnViewDidLoad()
        self.presenter.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    // MARK: - Setup Methods

    private func setupOnViewDidLoad() {
        configure()
    }

    // Configure Views and subviews
    private func setupView() {
        self.view.backgroundColor = Color.Background.background
        self.view.addSubview(tableView)
        setupConstraints()
    }

    // Apply AutoLayout Constraints
    private func setupConstraints() {
        tableView.fillSuperviewSafeAreaLayoutGuide()
    }

    // MARK: - Private Methods

    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - UniversityListingViewInput
    
    internal func displayUniversitiesSearchList(viewDetails: UniversityListingViewDetails) {
        displayedList = viewDetails.displayedList
    }
}

extension UniversityListingViewController {
    func showLoader() {
        super.showIndicator()
    }
    
    func hideLoader() {
        super.hideIndicator()
    }
    
    func showError(type: UniversityListingErrors) {
        let alertViewController = UIAlertController(title: "Ooops!!!", message: type.message, preferredStyle: .alert)
        self.present(alertViewController, animated: true)
    }
}

extension UniversityListingViewController: UITableViewDelegate, UITableViewDataSource {
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UniversityListTableViewCell = tableView.dequeueCell(with: indexPath)
        cell.setData(viewModel: displayedList[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.userDidSelectedItem(atIndex: indexPath.row)
    }
}
