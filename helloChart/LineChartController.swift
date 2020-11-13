//
//  ViewController.swift
//  helloChart
//
//  Created by Rocky on 11/13/20.
//

import UIKit
import Charts

class LineChartController: UIViewController {
    
    @IBOutlet weak var mainChart: LineChartView!
    @IBOutlet weak var dataTF: UITextView!
    
    var numbers : [Double] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addDataTouchUpIS(_ sender: Any) {
                let num = Double(dataTF.text!)!
        dataTF.text = ""
                numbers.append(num)
    }
    //    @IBAction func addDataTouchUpIS(_ sender: Any) {
//        let num = Double(dataTF.text!)!
//        numbers.append(num)
//    }
    
    func updateGraph(){
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
        

        mainChart.data = data //finally - it adds the chart data to the chart and causes an update
        mainChart.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
    }



}

