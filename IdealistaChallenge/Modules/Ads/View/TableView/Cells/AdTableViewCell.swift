//
//  AdTableViewCell.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 9/5/25.
//

import Foundation
import UIKit

public class AdTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    private var adImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 21.0)
        label.textAlignment = .left
        label.textColor = .text
        
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 15.0)
        label.textAlignment = .left
        label.textColor = .darkGray
        
        return label
    }()
    
    private var infoView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.textColor = .text
        
        return label
    }()
    
    private var favButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var favDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10.0)
        label.textAlignment = .right
        label.textColor = .gray
        
        return label
    }()
    
    private var separatorView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: - Initializers
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureView()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Layout
    
    private func configureView() {
        selectionStyle = .none
        configureadImageView()
        configureNameLabel()
        configureDesriptionLabel()
        configureFavButton()
        configureInfoView()
        configureInfoLabel()
        configureFavLabel()
        configureSeparatorView()
    }
    
    private func configureadImageView() {
        contentView.addSubview(adImageView)
        adImageView.top(withView: contentView, constant: 5.0)
        adImageView.leading(withView: contentView, constant: 12.0)
        adImageView.trailing(withView: contentView, constant: -12.0)
        adImageView.height(constant: 200.0)
    }
    
    private func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.top(toBottom: adImageView, fromView: contentView, constant: 10)
        nameLabel.leading(toView: adImageView, fromView: contentView)
        nameLabel.trailing(toView: adImageView, fromView: contentView)
    }
    
    private func configureDesriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.top(toBottom: nameLabel, fromView: contentView)
        descriptionLabel.leading(toView: nameLabel, fromView: contentView)
        descriptionLabel.trailing(toView: nameLabel, fromView: contentView)
    }
    private func configureFavButton() {
        contentView.addSubview(favButton)
        favButton.height(constant: 25.0)
        favButton.width(constant: 25.0)
        favButton.top(toBottom: descriptionLabel, fromView: contentView, constant: 10.0)
        favButton.trailing(toView: descriptionLabel, fromView: contentView)
    }
    
    private func configureFavLabel() {
        contentView.addSubview(favDateLabel)
        favDateLabel.centerY(withView: favButton, fromView: contentView)
        favDateLabel.right(toLeft: favButton, fromView: contentView, constant: -4.0)
        favDateLabel.leading(toView: infoLabel, fromView: contentView, constant: 8.0, relation: .greaterThanOrEqual)
    }
    
    private func configureInfoView() {
        contentView.addSubview(infoView)
        infoView.height(constant: 10.0)
        infoView.width(constant: 10.0)
        infoView.centerY(withView: favButton, fromView: contentView)
        infoView.leading(toView: descriptionLabel, fromView: contentView)
    }
    
    private func configureInfoLabel() {
        contentView.addSubview(infoLabel)
        infoLabel.centerY(withView: infoView, fromView: contentView)
        infoLabel.left(toRight: infoView, fromView: contentView, constant: 8.0)
        
    }
    
    private func configureSeparatorView() {
        contentView.addSubview(separatorView)
        separatorView.top(toBottom: favButton, fromView: contentView, constant: 12.0)
        separatorView.bottom(withView: contentView, priority: 900)
        separatorView.leading(withView: contentView)
        separatorView.trailing(withView: contentView)
        separatorView.height(constant: 0.5)
    }
    
    // MARK: - Public Methods
    
    public func configureCell(with item: AdCellRepresentable) {
        adImageView.load(url: item.imageURL)
        nameLabel.text = item.address
        descriptionLabel.text = item.description
        infoView.backgroundColor = item.operationColor ?? .clear
        infoLabel.text = item.operation
        favButton.onTouch = { (button) in
            item.onClickFavButton?()
        }
        configureFav(item: item)
        favDateLabel.text = item.favDate
    }
    
    // MARK: - Private Methods {
    
    private func configureFav(item: AdCellRepresentable) {
        let favImage: UIImage = item.isFav ? .favOn : .favOff
        favButton.setImage(favImage, for: .normal)
    }
}
