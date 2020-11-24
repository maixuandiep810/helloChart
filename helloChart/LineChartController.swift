//
//  ViewController.swift
//  helloChart
//
//  Created by Rocky on 11/13/20.
//

import UIKit
import Charts

class LineChartController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var mainChart: UIView!
    @IBOutlet weak var dataTF: UITextView!
    var lineChartView = LineChartView()
    
    var numbers : [Double] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        lineChartView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addDataTouchUpIS(_ sender: Any) {
        let value = dataTF.text == "" ? "1" : dataTF.text
                let num = Double(value!)!
                dataTF.text = ""
                numbers.append(num)
        updateGraph()
    }
    
    func updateGraph(){
        
        lineChartView.frame = CGRect(x: mainChart.frame.origin.x, y: mainChart.frame.origin.y, width: mainChart.frame.size.width, height: mainChart.frame.size.height)
        lineChartView.center = mainChart.center
        
        view.addSubview(lineChartView)
        numbers = [Double](arrayLiteral: 1, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2, 2, 2.3, 2.4, 2.3, 2.2, 2, 1.9, 2.2)
        
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        
        //here is the for loop
        for i in 0..<numbers.count {

            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }

        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue

        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        

        lineChartView.data = data //finally - it adds the chart data to the chart and causes an update
        lineChartView.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
    }



}

