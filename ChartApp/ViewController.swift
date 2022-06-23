//
//  ViewController.swift
//  ChartApp
//
//  Created by AmritPandey on 23/06/22.
//

import UIKit
import Charts

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appraisalData()
    }
    

    func appraisalData() {
        MockDataStore.mockData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .sucess(appraisals):
                self.loadChart(appraisal: appraisals)
            case .failure:
                self.showError()
            }
        }
    }
    
    func loadChart(appraisal: Appraisals) {
        appraisal.appraisal.map{ print($0.appraisedDate)}
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Alert in loading graph", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

