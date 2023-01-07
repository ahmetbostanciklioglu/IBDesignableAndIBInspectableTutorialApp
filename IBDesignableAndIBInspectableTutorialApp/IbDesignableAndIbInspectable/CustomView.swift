//
//  CustomView.swift
//  IBDesignableAndIBInspectableTutorialApp
//
//  Created by Ahmet Bostancıklıoğlu on 29.12.2022.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    
    @IBOutlet var view: CustomView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        modifiedCustomView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
       let _ =  loadViewFromNib()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: "CustomXib", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        return view
    }
    
    @IBInspectable
    var backgroundcolor: UIColor = .systemPink {
        didSet {
            self.backgroundColor = backgroundcolor
        }
    }
    
    @IBInspectable
    var cornersOfCustomView: CGFloat = 8 {
        didSet {
            self.layer.cornerRadius = cornersOfCustomView
        }
    }
    
    @IBInspectable
    var borderOfCustomView: UIColor = .systemBlue {
        didSet {
            self.layer.borderColor = borderOfCustomView.cgColor
        }
    }
    
    @IBInspectable
    var withOfCustomView: CGFloat = 8 {
        didSet {
            self.layer.borderWidth = withOfCustomView
        }
    }
    
    override func prepareForInterfaceBuilder() {
        modifiedCustomView()
    }
    
    func modifiedCustomView() {
        self.backgroundColor = backgroundcolor
        self.layer.cornerRadius = cornersOfCustomView
        self.layer.borderColor = borderOfCustomView.cgColor
        self.layer.borderWidth = withOfCustomView
    }
    
    
}
