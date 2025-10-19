//
//  CharacterCollectionViewCell.swift
//  RAM
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 19.10.2025.
//

import UIKit
import SDWebImage

struct CharacterCollectionViewCellViewModel {
    let imageName: String?
    let name: String?
    let status: String?
}

final class CharacterCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CharacterCollectionViewCell"
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            characterImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5)
        ])
    }
    
    func populate(with viewModel: CharacterCollectionViewCellViewModel) {
        characterImageView.sd_setImage(with: URL(string: viewModel.imageName ?? ""))
        nameLabel.text = viewModel.name
        statusLabel.text = viewModel.status
    }
}
