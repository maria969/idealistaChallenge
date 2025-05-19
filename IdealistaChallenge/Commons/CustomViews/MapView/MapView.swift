//
//  MapView.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 19/5/25.
//

import Foundation
import MapKit

public class MapView: UIView {
    
    // MARK: - Public Properties
    
    public let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    // MARK: - Private Properties
    
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
        configureMapView()
    }
    
    private func configureMapView() {
        addSubview(mapView)
        mapView.top(withView: self)
        mapView.bottom(withView: self)
        mapView.leading(withView: self)
        mapView.trailing(withView: self)
    }
    
    // MARK: - Public Methods
    
    public func addAnotation(latitude: Double, longitude: Double) {
        let annotation = MKPointAnnotation()
        
        let latitudeDegrees = CLLocationDegrees(latitude)
        let longitudeDegrees = CLLocationDegrees(longitude)
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitudeDegrees, longitude:longitudeDegrees)
        annotation.coordinate = centerCoordinate
        mapView.addAnnotation(annotation)
        
        let viewRegion = MKCoordinateRegion(center: centerCoordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(viewRegion, animated: false)
    }
}
