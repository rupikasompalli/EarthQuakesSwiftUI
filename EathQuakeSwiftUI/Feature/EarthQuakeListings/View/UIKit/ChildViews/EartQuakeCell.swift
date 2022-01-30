//
//  EartQuakeCell.swift
//  EartQuakeListings
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import UIKit

class EartQuakeCell: UITableViewCell {
    
    static let Identifier = "EartQuakeCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var severityLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var contentHolder: UIView!
    @IBOutlet weak var severityView: UIView!
    
    
    var earthQuakeData: EartQuakeData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customiseView()
    }
    
    func customiseView() {
        severityView.layer.cornerRadius = 10
        severityLabel.textColor = .white
    }

    func showData(data: EartQuakeData) {
        self.earthQuakeData = data
        if data.magnitude > 8.0 {
            severityView.backgroundColor = UIColor(red: 0.96, green: 0.26, blue: 0.21, alpha: 1.00)
            severityLabel.text = "HIGH"
        } else {
            severityView.backgroundColor = UIColor(red: 0.13, green: 0.60, blue: 0.16, alpha: 1.00)
            severityLabel.text = "LOW"
        }
        DispatchQueue.main.async { [weak self] in
            self?.dateLabel.text = data.datetime.displayDate
            self?.magnitudeLabel.text = "\(data.magnitude)"
            self?.depthLabel.text = "\(data.depth)"
        }
    }
    
    @IBAction func locationTapped() {
        guard let data = earthQuakeData else {
            return
        }
        // TODO
    }
}
