//
//  AdDetailTableViewCell.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation
import UIKit

public class AdDetailTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    private var adImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    private var infoStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10.0
        
        return view
    }()
    
    private var operationView: InfoView = {
        let view = InfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.titleLabel.text = "Operation" //TODO: - Add Localized
        
        return view
    }()
    
    private var sizeView: InfoView = {
        let view = InfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        view.titleLabel.text = "Size" //TODO: - Add Localized
        
        return view
    }()
    
    private var roomsView: InfoView = {
        let view = InfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.titleLabel.text = "Rooms" //TODO: - Add Localized
        
        return view
    }()
    
    private var bathroomsView: InfoView = {
        let view = InfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        view.titleLabel.text = "Bathrooms" //TODO: - Add Localized
        
        return view
    }()
    
    private var floorView: InfoView = {
        let view = InfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.titleLabel.text = "Floor" //TODO: - Add Localized
        
        return view
    }()
    
    private var flatLocation: InfoView = {
        let view = InfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        view.titleLabel.text = "Flat Location" //TODO: - Add Localized
        
        return view
    }()
    
    // MARK: - Initializers
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    // MARK: - Layout
    
    private func configureView() {
        selectionStyle = .none
        configureAdImageView()
        configureInfoStackView()
        configureDescriptionLabel()
    }
    
    private func configureAdImageView() {
        contentView.addSubview(adImageView)
        adImageView.top(withView: contentView, constant: 20.0)
        adImageView.centerX(withView: contentView)
        adImageView.leading(withView: contentView, constant: 20.0)
        adImageView.trailing(withView: contentView, constant: -20.0)
        adImageView.height(constant: 200.0)
        adImageView.aspectRatio()
    }
    
    private func configureInfoStackView() {
        contentView.addSubview(infoStackView)
        infoStackView.top(toBottom: adImageView, fromView: contentView, constant: 20.0)
        infoStackView.leading(withView: contentView, constant: 20.0)
        infoStackView.trailing(withView: contentView, constant: -20.0)
        
        configureInfoRow(withViews: [operationView, sizeView])
        configureInfoRow(withViews: [roomsView, bathroomsView])
        configureInfoRow(withViews: [floorView, flatLocation])
    }
    
    private func configureDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.top(toBottom: infoStackView, fromView: contentView, constant: 20.0)
        descriptionLabel.bottom(withView: contentView, constant: -10.0)
        descriptionLabel.leading(withView: contentView, constant: 20.0, relation: .greaterThanOrEqual)
        descriptionLabel.trailing(withView: contentView, constant: -20.0)
        descriptionLabel.centerX(withView: contentView)
    }
    
    private func configureInfoRow(withViews views: [UIView]) {
        let row = UIStackView(frame: .zero)
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.alignment = .fill
        row.spacing = 10.0
        
        views.forEach { row.addArrangedSubview($0) }
        
        infoStackView.addArrangedSubview(row)
    }
    
    // MARK: - Public Methods
    
    public func configureCell(with item: AdDetailCellRepresentable) {
        if let imageUrl = item.multimedia.first?.url {
            adImageView.load(url: URL(string: imageUrl))
        }
        
        descriptionLabel.text = item.comment
        operationView.valueLabel.text = item.operation
        sizeView.valueLabel.text = item.constructedArea.description
        roomsView.valueLabel.text = item.roomNumber.description
        bathroomsView.valueLabel.text = item.bathNumber.description
        floorView.valueLabel.text = item.floor
        flatLocation.valueLabel.text = item.flatLocation
        
        checkInfoViews()
    }
    
    // MARK: - Private Methods
    
    private func checkInfoViews() {
        let views = [operationView, sizeView, roomsView, bathroomsView, floorView, flatLocation]
        views.forEach { $0.isHidden = $0.valueLabel.text == nil || $0.valueLabel.text == "" }
    }
}
