//
//  ItemView.swift
//  Lab
//
//  Created by Macbook Pro on 05/03/2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit

class ItemView: UIView {
    
    public var origin = CGPoint(x: 0.0, y: 0.0)
    public var size = CGSize(width: Sizes.width, height: Sizes.height)
    public var identifier: Int = 0
    
    private struct Sizes {
        static let width: CGFloat = 30.0
        static let height: CGFloat = 35.0
        static let offset: CGFloat = 5.0
    }
    
    public func setOriginByIndex(_ index: (row: Int, column: Int)) {
        let offsetByX = Sizes.offset + CGFloat(index.column) * (Sizes.width + Sizes.offset)
        let offsetByY = Sizes.offset + CGFloat(index.row) * (Sizes.height + Sizes.offset)
        self.origin = CGPoint(x: offsetByX, y: offsetByY)
        //self.frame = CGRect(origin: origin, size: CGSize(width: Sizes.width, height: Sizes.height))
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    public lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        layoutIfNeeded()
        return label
    }()
    
    private func configureLabel() {
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func configure() {
        self.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        configureLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLabel()
    }
    
}
