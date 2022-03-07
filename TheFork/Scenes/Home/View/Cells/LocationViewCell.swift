//
//  LocationView.swift
//  TheFork
//
//  Created by Oscar on 4/03/22.
//

import UIKit
import MapKit

class LocationViewCell: UICollectionViewCell {
 
    var initialLocation = CLLocation(latitude: 37.3326395, longitude: -122.007676)
    
    private lazy var coordinateRegion: MKCoordinateRegion = {
        let region = MKCoordinateRegion(
            center: initialLocation.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
        return region
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()

    override init(frame: CGRect) {
      super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    func update(location: CLLocation?) {
        guard let location = location else { return }
        self.initialLocation = location
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

private extension LocationViewCell {
    func setupUI() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mapView)
        mapView.pinTo(view: self)
    }
}
