//
//  UniversityListTableViewCell.swift
//
//
//  Created by Vijay  on 17/07/2024.
//

import UIKit
import UIComponents

final class UniversityListTableViewCell: BaseTableViewCell {
    
    override func prepareView() {
        super.prepareView()
        applyStyles()
        addViewsAndConstraints()
    }
    
    private func applyStyles() {
        lblTitle.numberOfLines = 0
        ivTitle.withSize(.init(width: Dimension.size2_5, height: Dimension.size2_5))
        ivTitle.tintColor = Color.Grey.grey50
        ivTitle.image = UIImage(systemName: "chevron.forward.circle.fill")
    }
    
    private func addViewsAndConstraints() {
        let labelStack = UIView().addStackView(views: [lblTitle, lblSubTitle],
                                               spacing: Dimension.spacing12)
        
        let mainStack = self.contentView.addStackView(.horizontal,
                                                      views: [labelStack, ivTitle],
                                                      spacing: Dimension.spacing10,
                                                      alignment: .center,
                                                      pinToAllSides: false)
        
        mainStack.anchor(
            .top(self.contentView.topAnchor, constant: Dimension.spacing9),
            .trailing(self.contentView.trailingAnchor, constant: Dimension.spacing9),
            .bottom(self.contentView.bottomAnchor, constant: Dimension.spacing9),
            .leading(self.contentView.leadingAnchor, constant: Dimension.spacing9)
        )
        
        let divider = UIView().apply {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = Color.divider
            $0.withHeight(Dimension.size6 * 0.5)
        }
        self.contentView.addSubview(divider)
        divider.anchor(
            .trailing(self.contentView.trailingAnchor, constant: Dimension.spacing9),
            .bottom(self.contentView.bottomAnchor, constant:0),
            .leading(self.contentView.leadingAnchor, constant: Dimension.spacing9)
        )
    }
    
    func setData(viewModel: UniversityListTableViewCellViewModel) {
        self.lblTitle.text = viewModel.title
        self.lblSubTitle.text = viewModel.subTitle
    }
}

extension UniversityListTableViewCell {
    struct ViewModel {
        var title: String
        var subTitle: String
    }
}

typealias UniversityListTableViewCellViewModel = UniversityListTableViewCell.ViewModel
