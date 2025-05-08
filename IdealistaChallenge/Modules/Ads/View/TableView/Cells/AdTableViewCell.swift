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
        label.textColor = .black
        
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
        label.textColor = .black
        
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
        configureInfoView()
        configureInfoLabel()
        configureSeparatorView()
    }
    
    private func configureadImageView() {
        contentView.addSubview(adImageView)
        adImageView.centerY(withView: contentView)
        adImageView.leading(withView: contentView, constant: 12.0)
        adImageView.trailing(withView: contentView, constant: -12.0)
        adImageView.height(constant: 200.0)
    }
    
    private func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.top(toBottom: adImageView, fromView: contentView, constant: 10)
        nameLabel.leading(toView: adImageView, fromView: contentView)
    }
    
    private func configureInfoView() {
        contentView.addSubview(infoView)
        infoView.height(constant: 10.0)
        infoView.width(constant: 10.0)
        infoView.top(toBottom: nameLabel, fromView: contentView, constant: 10.0)
        infoView.leading(toView: nameLabel, fromView: contentView)
    }
    
    private func configureInfoLabel() {
        contentView.addSubview(infoLabel)
        infoLabel.centerY(withView: infoView, fromView: contentView)
        infoLabel.left(toRight: infoView, fromView: contentView, constant: 8.0)
        infoLabel.trailing(withView: contentView, constant: -16.0)
    }
    
    private func configureSeparatorView() {
        contentView.addSubview(separatorView)
        separatorView.top(toBottom: infoView, fromView: contentView, constant: 12.0)
        separatorView.bottom(withView: contentView, priority: 900)
        separatorView.leading(withView: contentView, constant: 20.0)
        separatorView.trailing(withView: contentView)
        separatorView.height(constant: 0.5)
    }
    
    // MARK: - Public Methods
    
    public func configureCell(with item: AdCellRepresentable) {
        
        adImageView.load(url: item.imageURL)
//        adImageView.image = UIImage.home
        nameLabel.text = item.address
        infoView.backgroundColor = item.operationColor ?? .clear
        infoLabel.text = item.operation
    }
}

extension UIImageView {
    func load(url: URL?) {
        guard let url = url else {
            self.image = UIImage.home
            return }
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return }
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    strongSelf.image = image
                }
            }
        }
    }
}
