//
//  LocationSelector.swift
//  LocationSelector
//
//  Created by Eros Bonanni on 23/05/2018.
//  Copyright © 2018 Eros Bonanni. All rights reserved.
//

import UIKit
import GoogleMaps

public class LocationSelector: UIViewController {
    
    // MARK: - Properties
    
    public weak var delegate: LocationSelectorDelegate?
    public var appearance = LocationSelectorAppearance()
    var location: Location?
    
    // MARK: - Initializers
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        setupConstraints()
    }
    
    // MARK: - Implementation
    
    @objc func buttonPressed() {
        guard let location = location else {
            print("There is not any location selected.")
            return
        }
        
        delegate?.locationSelected(location: location)
        dismiss(animated: true)
    }
    
    @objc func cancel() {
        dismiss(animated: true) {
            self.delegate?.locationSelectorDidCancel()
        }
    }
    
    // MARK: - Declarations
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var headerContainer: UIView = {
        let v = UIView()
        v.backgroundColor = appearance.primaryColor
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "Avenir-Regular", size: 16)
        l.text = appearance.title
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    lazy var mapView: GMSMapView = {
        let camera = GMSCameraPosition.camera(withLatitude: -37.9861845918367,
                                              longitude: -57.5517018571429, zoom: 6.0)
        let mv = GMSMapView.map(withFrame: .zero, camera: camera)
        mv.layer.cornerRadius = 15
        mv.clipsToBounds = true
        if let mapStyle = appearance.mapStyle { mv.mapStyle = mapStyle }
        return mv
    }()
    
    private lazy var searchBar: UISearchBar = {
        let s = UISearchBar()
        s.backgroundColor = .clear
        s.delegate = self
        s.searchBarStyle = .minimal
        s.barTintColor = .white
        return s
    }()
    
    private lazy var button: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle(appearance.buttonTitle, for: .normal)
        b.setTitleColor(appearance.textColor, for: .normal)
        b.backgroundColor = appearance.primaryColor
        b.layer.cornerRadius = 20
        b.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return b
    }()
    
    private lazy var cancelButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Cancel", for: .normal)
        b.setTitleColor(.lightGray, for: .normal)
        b.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return b
    }()

    // MARK: - Constraints
    
    private func setupConstraints() {
        view.addSubviewsForAutoLayout(container)
        container.addSubviewsForAutoLayout(headerContainer, searchBar, mapView, button, cancelButton)
        headerContainer.addSubviewsForAutoLayout(titleLabel)
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            container.heightAnchor.constraint(equalToConstant: 400),
            
            headerContainer.topAnchor.constraint(equalTo: container.topAnchor),
            headerContainer.leftAnchor.constraint(equalTo: container.leftAnchor),
            headerContainer.rightAnchor.constraint(equalTo: container.rightAnchor),
            headerContainer.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerXAnchor.constraint(equalTo: headerContainer.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
            
            searchBar.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 10),
            searchBar.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            searchBar.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -40),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            mapView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            mapView.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -50),
            mapView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -12),
            
            button.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -12),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            button.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -50),
            
            cancelButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            cancelButton.centerXAnchor.constraint(equalTo: container.centerXAnchor)
            ])
    }
    
}
