//
//  ProductDetailViewController.swift
//  Shirtist
//
//  Created by Ravi Shankar Jha on 07/12/15.
//  Copyright © 2015 Ravi Shankar Jha. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var effectivePrice: UILabel!
    
    @IBAction func addToCart(sender: UIButton) {
    }
    @IBAction func checkout(sender: UIButton) {
    }
    @IBOutlet weak var selectSizeTextFld: UITextField!
    
    @IBOutlet weak var selectQuantityTextFld: UITextField!
    
    
    @IBOutlet weak var selectStyleTextFld: UITextField!
    @IBOutlet weak var btnOne: UIButton!
    
    @IBOutlet weak var btnTwo: UIButton!
    
    @IBOutlet weak var btnThree: UIButton!
    
    @IBOutlet weak var btnFour: UIButton!
    
    @IBAction func btnOneClicked(sender: UIButton) {
        
        btnOne.enabled = false
        btnTwo.enabled = true
        btnThree.enabled = true
        btnFour.enabled = true
        
        
        mainImage.image = btnOne.backgroundImageForState(.Normal)
        
    }
    @IBAction func btnTwoClicked(sender: UIButton) {
        
        btnOne.enabled = true
        btnTwo.enabled = false
        btnThree.enabled = true
        btnFour.enabled = true
        
        mainImage.image = btnTwo.backgroundImageForState(.Normal)
        
    }
    
    @IBAction func btnThreeClicked(sender: UIButton) {
        
        btnOne.enabled = true
        btnTwo.enabled = true
        btnThree.enabled = false
        btnFour.enabled = true
        
        
        mainImage.image = btnThree.backgroundImageForState(.Normal)
    }
    
    @IBAction func btnFourClicked(sender: UIButton) {
        
        btnOne.enabled = true
        btnTwo.enabled = true
        btnThree.enabled = true
        btnFour.enabled = false
        
        
        mainImage.image = btnFour.backgroundImageForState(.Normal)
    }
    
    
    var productImages: [String] = []
    var productNameText = ""
    let sizeOptions = ["X", "XL", "L", "S", "M"]
    let quantityOptions = ["1","2","3","4","5","6","7","8","9","10"]
    let styleOptions = ["A", "B", "C"]
    
    let sizePickerView = UIPickerView()
    let quantityPickerView = UIPickerView()
    let stylePickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizePickerView.delegate = self
        quantityPickerView.delegate = self
        stylePickerView.delegate = self
        
        selectSizeTextFld.inputView = sizePickerView
        
        selectQuantityTextFld.inputView = quantityPickerView
        
        selectStyleTextFld.inputView = stylePickerView
        
        
        let toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.BlackTranslucent
        
        toolBar.tintColor = UIColor.whiteColor()
        
        toolBar.backgroundColor = UIColor.blackColor()
        
        
        //let defaultButton = UIBarButtonItem(title: "Default", style: UIBarButtonItemStyle.Plain, target: self, action: "tappedToolBarBtn:")
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "donePressed:")
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        
        label.backgroundColor = UIColor.clearColor()
        
        label.textColor = UIColor.whiteColor()
        
        label.text = "Select option"
        
        label.textAlignment = NSTextAlignment.Center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        selectSizeTextFld.inputAccessoryView = toolBar
        
        selectQuantityTextFld.inputAccessoryView = toolBar
        
        selectStyleTextFld.inputAccessoryView = toolBar
        
        
        
        productName.text = productNameText
        mainImage.image = UIImage(named:productImages[0])
        btnOne.setBackgroundImage(UIImage(named: productImages[0]), forState: .Normal)
        btnOne.enabled = false
        btnTwo.setBackgroundImage(UIImage(named: productImages[1]), forState: .Normal)
        btnTwo.enabled = true
        btnThree.setBackgroundImage(UIImage(named: productImages[2]), forState: .Normal)
        btnThree.enabled = true
        btnFour.setBackgroundImage(UIImage(named: productImages[3]), forState: .Normal)
        btnFour.enabled = true
        // Do any additional setup after loading the view.
    }

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == sizePickerView
        {
            
            return sizeOptions.count
            
        } else if pickerView == quantityPickerView
        {
            return quantityOptions.count
        } else
        {
             return styleOptions.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView == sizePickerView
        {
            
            return sizeOptions[row]
            
        } else if pickerView == quantityPickerView
        {
            return quantityOptions[row]
        } else
        {
            return styleOptions[row]
        
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        
        if pickerView == sizePickerView
        {
            
            selectSizeTextFld.text = sizeOptions[row]
            
        } else if pickerView == quantityPickerView
        {
            selectQuantityTextFld.text = quantityOptions[row]
            priceLabel.text = "Price for \(quantityOptions[row])"
            effectivePrice.text = "new price"
            
        } else
        {
            selectStyleTextFld.text = styleOptions[row]
            
        }
        
        
    }
    
    
    func donePressed(sender: UIBarButtonItem) {
        
        selectSizeTextFld.resignFirstResponder()
        selectQuantityTextFld.resignFirstResponder()
        selectStyleTextFld.resignFirstResponder()
        
    }
    
//    func tappedToolBarBtn(sender: UIBarButtonItem) {
//        
//        selectSizeTextFld.text = "one"
//        
//        selectSizeTextFld.resignFirstResponder()
//    }
//    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
