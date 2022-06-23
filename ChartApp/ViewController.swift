//
//  ViewController.swift
//  ChartApp
//
//  Created by AmritPandey on 23/06/22.
//

import UIKit
import Charts
import TinyConstraints

class ViewController: UIViewController {

    lazy var lineChartView: LineChartView = {
        let lineChart = LineChartView()
        lineChart.backgroundColor = .blue
        lineChart.rightAxis.enabled = true
        
        let yAxis = lineChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        lineChart.xAxis.setLabelCount(6, force: false)
        lineChart.xAxis.labelTextColor = .white
        lineChart.xAxis.axisLineColor = .blue
        
        lineChart.animate(xAxisDuration: 2.5)
        
        return lineChart
    }()
    
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
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        setData(appraisal: appraisal)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Alert in loading graph", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

extension ViewController: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
    }
    
    func setData(appraisal: Appraisals) {
        let set1 = LineChartDataSet(entries: yValues(appraisedValue: appraisal.appraisal), label: "Date")
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 3
        set1.setColor(.white)
        set1.fill = ColorFill(color: .white)
        set1.fillAlpha = 0.8
        set1.drawFilledEnabled = true
        
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
    }
    
    func yValues(appraisedValue: [AppraisedData]) -> [ChartDataEntry] {
        var chartData = [ChartDataEntry]()
        chartData.append(ChartDataEntry(x: 0.0, y: 0.0))
        appraisedValue.forEach { data in
            chartData.append(ChartDataEntry(x: Double(data.appraisedDate), y: Double(data.appraisedValue)))
        }
        return chartData
    }
    
    
    
}


