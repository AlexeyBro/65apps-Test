//
//  TableViewCell.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

final class TableViewCell: UITableViewCell {

    let imageCell = UIImageView(contentMode: .scaleToFill)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        contentView.addSubview(imageCell)
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.single),
            imageCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.single),
            imageCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.single),
            imageCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.single)
        ])
    }
}
