import UIKit

class ViewController: UIViewController {
// Outlets
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitchControll: UISwitch!
    @IBOutlet weak var myProgressBar: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
// Variables
    private let pickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco", "Seis", "Siete"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.setTitle("Mi Boton", for: .normal)
        myButton.backgroundColor = .purple
        myButton.setTitleColor(.white, for: .normal)
        
        myPickerView.backgroundColor = .systemGray6
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        myPageControl.numberOfPages = pickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .darkGray
        myPageControl.pageIndicatorTintColor = .lightGray
        
        mySegmentedControl.removeAllSegments()
//        for (index, value) in pickerViewValues.enumerated() {
        for (index, _) in pickerViewValues.enumerated() {
            mySegmentedControl.insertSegment(withTitle: String(index + 1), at: index, animated: true)
        }
            
        mySlider.minimumTrackTintColor = .purple
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(pickerViewValues.count)
        mySlider.value = 0
        
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(pickerViewValues.count)
        
        mySwitchControll.isOn = false
        mySwitchControll.onTintColor = .purple
        
        myProgressBar.progress = 0
        myProgressBar.tintColor = .purple
        
        myActivityIndicator.color = .purple
        myActivityIndicator.startAnimating()
        myActivityIndicator.hidesWhenStopped = true
    }

// Actions

    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .purple {
            myButton.backgroundColor = .darkGray
            print(myButton.buttonType)
        } else {
            myButton.backgroundColor = .purple
        }
    }
    @IBAction func myPageControllAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let myString = pickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        mySlider.value = Float(myPageControl.currentPage)

    }
    @IBAction func mySegmetedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        let myString = pickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        mySlider.value = Float(mySegmentedControl.selectedSegmentIndex + 1)
    }
    @IBAction func mySliderAction(_ sender: Any) {
        
        var progress: Float = 0
        
        switch mySlider.value {
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            myPickerView.selectRow(0, inComponent: 0, animated: true)
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = pickerViewValues[0]
            myButton.setTitle(myString, for: .normal)
            progress = 0
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            myPickerView.selectRow(1, inComponent: 0, animated: true)
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = pickerViewValues[1]
            myButton.setTitle(myString, for: .normal)
            progress = 0.3
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            myPickerView.selectRow(2, inComponent: 0, animated: true)
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = pickerViewValues[2]
            myButton.setTitle(myString, for: .normal)
            progress = 0.45
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            myPickerView.selectRow(3, inComponent: 0, animated: true)
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = pickerViewValues[3]
            myButton.setTitle(myString, for: .normal)
            progress = 0.6
        case 5..<6:
            mySegmentedControl.selectedSegmentIndex = 4
            myPickerView.selectRow(4, inComponent: 0, animated: true)
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = pickerViewValues[4]
            myButton.setTitle(myString, for: .normal)
            progress = 0.8
        case 6..<7:
            mySegmentedControl.selectedSegmentIndex = 5
            myPickerView.selectRow(5, inComponent: 0, animated: true)
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = pickerViewValues[5]
            myButton.setTitle(myString, for: .normal)
            progress = 0.9
        default:
            mySegmentedControl.selectedSegmentIndex = 6
            myPickerView.selectRow(6, inComponent: 0, animated: true)
            myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
            let myString = pickerViewValues[6]
            myButton.setTitle(myString, for: .normal)
            progress = 1
        }
        myProgressBar.progress = progress

    }
    @IBAction func myStepperAction(_ sender: Any) {
        let stepperValue = myStepper.value
        mySlider.value = Float(stepperValue)
        myPageControl.currentPage = Int(stepperValue - 1)
        mySegmentedControl.selectedSegmentIndex = Int(stepperValue - 1)
        myPickerView.selectRow(Int(stepperValue - 1), inComponent: 0, animated: true)
    }
    @IBAction func mySwitchcontrollAction(_ sender: Any) {
        if mySwitchControll.isOn {
            myPickerView.isHidden = false
            myActivityIndicator.stopAnimating()
        } else {
            myPickerView.isHidden = true
            myActivityIndicator.startAnimating()
        }
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewValues.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = pickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
        
        mySegmentedControl.selectedSegmentIndex = row
        
        mySlider.value = Float(row + 1)
    }
}

