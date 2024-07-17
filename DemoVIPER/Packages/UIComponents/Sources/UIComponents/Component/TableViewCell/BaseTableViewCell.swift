//
//  BaseTableViewCell.swift
//  
//
//  Created by Vijay  on 17/07/2024.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {

    //MARK: UI Elements
    public lazy var viewBg: UIView = UIView().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var ivTitle: UIImageView = UIImageView().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    
    public lazy var lblTitle: TLabel = TLabel().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Color.Text.paragraph
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    public lazy var lblSubTitle: TLabel = TLabel().apply {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Color.Text.subtext
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    
    //MARK: Initialisation
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func prepareView() {
        self.contentView.addSubview(viewBg)
        viewBg.fillSuperview()
    }

}
