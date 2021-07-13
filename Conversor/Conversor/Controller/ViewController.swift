

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfildValue: UITextField!
    @IBOutlet weak var btnunity1: UIButton!
    @IBOutlet weak var btunity2: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var LabelResultUniy: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btnunity1.setTitle("Kilograma", for: .normal)
            btunity2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btnunity1.setTitle("Real", for: .normal)
            btunity2.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distância"
            btnunity1.setTitle("Metro", for: .normal)
            btunity2.setTitle("Kilometro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btnunity1.setTitle("Celsius", for: .normal)
            btunity2.setTitle("Farenheit", for: .normal)
        
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender{
            if sender == btnunity1{
                btunity2.alpha = 0.5
            }else{
                btnunity1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeigth()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
        view.endEditing(true)
        let result = Double(labelResult.text!)!
        labelResult.text = String(format: "%.2f", result)
    }
    func calcTemperature(){
        guard let temperature = Double(textfildValue.text!) else {return}
        if btnunity1.alpha == 1.0 {
            LabelResultUniy.text = "Farenheit"
            labelResult.text = String(temperature * 1.8 + 32.0)
        }else{
            LabelResultUniy.text = "Celsius"
            labelResult.text = String((temperature - 32.0)/1.8)
        }
    }
    func calcWeigth(){
        guard let weight = Double(textfildValue.text!) else {return}
        if btnunity1.alpha == 1.0 {
            LabelResultUniy.text = "Libra"
            labelResult.text = String(weight / 2.2046)
        }else{
            LabelResultUniy.text = "Kilograma"
            labelResult.text = String((weight * 1000))
        }
    }
    func calcCurrency(){
        guard let curreency = Double(textfildValue.text!) else {return}
        if btnunity1.alpha == 1.0 {
            LabelResultUniy.text = "Dolar"
            labelResult.text = String(curreency / 3.5)
        }else{
            LabelResultUniy.text = "Real"
            labelResult.text = String((curreency * 3.5))
        }
        
    }
    func calcDistance(){
        
    }
}

