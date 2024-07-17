//
//  UniversityDetailsViewController.swift
//
//
//  Created by Vijay  on 17/07/2024.
//
//

import UIKit
import Core
import UIComponents

final class UniversityDetailsViewController: BaseViewController, UniversityDetailsViewInput {
    
    // MARK: - Properties
    
    var presenter: UniversityDetailsViewOutput!
    
    public lazy var lblUniversityName: TLabel = TLabel().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        $0.textColor = Color.Text.heading
    }
    
    public lazy var lblUniversityState: TLabel = TLabel().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = Color.Text.subtext
    }
    
    public lazy var lblUniversityCountry: TLabel = TLabel().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = Color.Text.subtext
    }
    
    public lazy var lblUniversityCountryCode: TLabel = TLabel().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = Color.Text.subtext
    }
    
    public lazy var lblUniversityWebPageTitle: TLabel = TLabel().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = Color.Text.subtext
        $0.text = "Web Page"
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    public lazy var textViewUniversityWebPage: IntrinsicTextView = IntrinsicTextView().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = Color.Text.subtext
        $0.backgroundColor = .clear
    }
    
    public lazy var btnRefresh: UIButton = UIButton().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.imageView?.image = UIImage(systemName: "arrow.clockwise.circle.fill")
        $0.tintColor = Color.Grey.grey70
        $0.withSize(.init(width: Dimension.size1_5, height: Dimension.size1_5))
        $0.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
    }
    
    public lazy var btnClose: UIButton = UIButton().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.imageView?.image = UIImage(systemName: "xmark.circle.fill")
        $0.withSize(.init(width: Dimension.size1_5, height: Dimension.size1_5))
        $0.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        $0.tintColor = Color.Grey.grey70
    }
    
    // MARK: - Views
    
    private var contentView: UIView = UIView() // TODO: Remove
    
    // MARK: - ViewController Lifecycle
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnViewDidLoad()
        self.presenter.viewLoaded()
    }
    
    // MARK: - Setup Methods
    
    private func setupOnViewDidLoad() {
        self.view.backgroundColor = Color.Background.background
    }
    
    // Configure Views and subviews
    private func setupView() {
        let countryDetailsStack = UIView().addStackView(.horizontal,
                                                        views: [lblUniversityCountry, lblUniversityCountryCode],
                                                        spacing: Dimension.spacing12)
        let webPageStack = UIView().addStackView(.horizontal,
                                                 views: [lblUniversityWebPageTitle, textViewUniversityWebPage],
                                                 spacing: Dimension.spacing11, 
                                                 alignment: .top)
        let contentStack = UIView().addStackView(views: [lblUniversityState, countryDetailsStack, webPageStack],
                                                 spacing: Dimension.spacing11)
        self.view.addSubViews([
            btnClose,
            btnRefresh,
            lblUniversityName,
            contentStack]
        )
        
        setupConstraints()
        
        contentStack.anchor(
            .top(self.lblUniversityName.bottomAnchor, constant: Dimension.spacing11),
            .trailing(self.view.trailingAnchor, constant: Dimension.spacing8),
            .leading(self.view.leadingAnchor, constant: Dimension.spacing8)
        )
    }
    
    // Apply AutoLayout Constraints
    private func setupConstraints() {
        btnClose.anchor(
            .top(self.view.safeAreaLayoutGuide.topAnchor, constant: Dimension.spacing9),
            .leading(self.view.leadingAnchor, constant: Dimension.spacing9)
        )
        
        btnRefresh.anchor(
            .top(self.view.safeAreaLayoutGuide.topAnchor, constant: Dimension.spacing9),
            .trailing(self.view.trailingAnchor, constant: Dimension.spacing9)
        )
        
        lblUniversityName.anchor(
            .top(self.btnClose.bottomAnchor, constant: Dimension.spacing9),
            .leading(self.view.leadingAnchor, constant: Dimension.spacing9),
            .trailing(self.view.trailingAnchor, constant: Dimension.spacing9)
        )
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        
    }
    
    // MARK: - UniversityDetailsViewInput
    func displayUniversityDetails(viewModel: UniversityDetailViewModel) {
        lblUniversityName.text = viewModel.name
        lblUniversityState.text = viewModel.stateProvince
        lblUniversityCountry.text = viewModel.country
        lblUniversityCountryCode.text = viewModel.alphaTwoCode
        textViewUniversityWebPage.superview?.isHidden = viewModel.attributedStringWebPage?.string.isEmpty ?? true
        textViewUniversityWebPage.attributedText = viewModel.attributedStringWebPage
    }
    
    // MARK: Actions
    @objc
    private func refreshButtonPressed() {
        
    }
    
    @objc
    private func backButtonPressed() {
        self.dismiss(animated: true)
    }
}
