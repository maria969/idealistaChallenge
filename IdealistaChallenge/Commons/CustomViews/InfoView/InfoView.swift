//
//  InfoView.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation
import UIKit

public class InfoView: UIView {
    
    // MARK: - Public Properties
    
    public var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14.0)
        label.textAlignment = .left
        label.textColor = .lightGray
        
        return label
    }()
    
    public var valueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17.0)
        label.textAlignment = .left
        label.textColor = .black
        
        return label
    }()
    
    public var textAlignment: NSTextAlignment = .left {
        didSet {
            titleLabel.textAlignment = textAlignment
            valueLabel.textAlignment = textAlignment
        }
    }
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    // MARK: - Layout
    
    private func configureView() {
        backgroundColor = .clear
        configureTitleLabel()
        configureValueLabel()
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.top(withView: self)
        titleLabel.leading(withView: self)
        titleLabel.trailing(withView: self)
    }
    
    private func configureValueLabel() {
        addSubview(valueLabel)
        valueLabel.top(toBottom: titleLabel, fromView: self, constant: 2.0)
        valueLabel.bottom(withView: self)
        valueLabel.leading(toView: titleLabel, fromView: self)
        valueLabel.trailing(toView: titleLabel, fromView: self)
    }
}
