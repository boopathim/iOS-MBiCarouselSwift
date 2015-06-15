//

/*

Developer Name : MaxymusBoopathy

iOS Developer

email: www.mboopathi@gmail.com
iCloud: maxymusboopathy@iCloud.com

Phone: +91 9952671049/ +91 8861277070

Work: Bangalore

Home: Tamilnadu - Salem - Rasipuram - Namagiripettai

*/
//
//  iCarousel.swift
//  MBiCarouselSwift

// MB- MaxymusBoopathy

//  ViewController.swift
//  MBiCarouselSwift
//
//  Created by boopathi on 12/06/15.
//  Copyright (c) 2015 MaxymusBoopathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,iCarouselDataSource, iCarouselDelegate,UIPickerViewDataSource,UIPickerViewDelegate
 {

    // not Needed
    var items: [Int] = []
    
    // Insert the Image names Here
    var pageImages: NSArray = NSArray(objects: "3","4","5","6","2","3","4","5","6","2","3","4","5","6","2","3","4","5","6","2","3","4","5","6","2","3","4","5","6","2","3","4","5","6","2","3","4","5","6","2","3","4","5","6","2","3","4","5","6")
    
    
    //Mark - iCarousel
    
    @IBOutlet var carousel : iCarousel!
    
    var reflectionView: ReflectionView!
    
    var alertVc: UIAlertController!
    
    var carouselSize: CGFloat! = 2.0
    
    var carouselBorderWidth: CGFloat! = 0.5
    
    
    
    var imageView: UIImageView!
    
    
    
    
    //Mark - PickerView
    
    
    //Picker Values in array - data - For Row1 and Row2
    
    //Values - Row1
    let carouselType = ["Linear", "Rotary", "InvertedRotary", "Cylinder", "InvertedCylinder", "Wheel", "InvertedWheel", "CoverFlow", "CoverFlow2", "TimeMachine","InvertedTimeMachine"]
    
    //Values - Row2
    let shape = ["Horizontal","Vertical"]
    
    let size = ["0","20","50","70","100","200"]
    
    
    
    //Picker View Outlets
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var pickerSwitch: UISwitch!
    
    @IBAction func pickerSwitchAction(sender: AnyObject) {
        
        if pickerSwitch.on{
            
            pickerView.hidden = false
            
            showCloseBtn.hidden = false
            
        } else{
            
            pickerView.hidden = true
            
            showCloseBtn.hidden = true
            
        }
        
    }
    
    
    //Mark - Tool Bar bottom View
    
    @IBOutlet weak var bottomTBar: UIToolbar!
    
    @IBOutlet weak var showCloseBtn: UISegmentedControl!
    
    
    // We are not using Items array - will be usable if needed
    override func awakeFromNib()
    {
        super.awakeFromNib()
        for i in 0...99
        {
            
            items.append(i)
            
        }
    }
    
    
    override func viewDidLoad()
        
    {
        super.viewDidLoad()
        
        //Initial Loading - Type of Carousel
        
        
        
        
        
        // Set the delegate and Data Source of Pickerview
        
        pickerView.delegate = self
        
        pickerView.dataSource = self
        
        
        
        //Hide the pickerview and ShowClose Button during viewDidLoad, its should be visible only if Switch is on
        
        pickerView.hidden = true
        
        showCloseBtn.hidden = true
        
        
        
    }
    
    
    //Action of Show and Close Button - not Needed now
    @IBAction func showCloseBtnAction(sender: AnyObject) {
        
        
        switch (sender.selectedSegmentIndex) {
            
        case 0:
            println("show")
            
            /* alertVc = UIAlertController(title: "sample", message: "message", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            
            alertVc.addAction(UIAlertAction(title: "sample", style: UIAlertActionStyle.Default, handler: nil))
            
            
            self.presentViewController(alertVc, animated: true, completion: nil)
            */
            
            pickerView.hidden = false
            
            showCloseBtn.hidden = false
            
            break;
            
        case 1:
            println("Close")
            
            pickerView.hidden = true
            
            showCloseBtn.hidden = true
            
            break;
        default:
            break;
        }
    }
    
    
    
    
    
    
    //Mark - Picker View Implementation
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        //No of PickerView Sections - we are using 2 sections
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        //initalize the count
        var count: Int = 0
        
        switch (component) {
            
        case 0:
            
            count = carouselType.count
            
        case 1:
            
            count = shape.count
            
        case 2:
            
            count = size.count
            
        default:
            break;
        }
        
        return count
    }
    
    //This is not needed as we are using attributed string method - as we are customising the text in the pickerview to white color
    
    /* func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    
    
    
    var title: String = ""
    
    
    switch (component) {
    case 0:
    
    title = carouselType[row]
    
    
    case 1:
    title = "\(shape[row])"
    
    
    default:
    break;
    }
    
    return title
    }
    
    */
    
    
    // Changing the text in the label when chaging the values in the picker view
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //START - of Component Row Switch Case
        
        
        
        switch (component) {
            
        case 0:
            
            // let carouselType = ["Linear", "Rotary", "InvertedRotary", "Cylinder", "InvertedCylinder", "Wheel", "InvertedWheel", "CoverFlow", "CoverFlow2", "TimeMachine", "InvertedTimeMachine"]
            
            
            // START - of Switch case for Row 1 - change Carousel type
            
            switch (carouselType[row]) {
                
            case "Linear":
                
                carousel.type  = .Linear
                
                
                break;
                
            case "Rotary":
                
                
                carousel.type  = .Rotary
                
                break;
                
            case "InvertedRotary":
                
                carousel.type  = .InvertedRotary
                
                break;
                
                
                
            case "Cylinder":
                
                carousel.type  = .Cylinder
                
                break;
                
            case "InvertedCylinder":
                
                carousel.type  = .InvertedCylinder
                
                break;
                
            case "Wheel":
                
                carousel.type  = .Wheel
                
                break;
                
            case "InvertedWheel":
                
                carousel.type  = .InvertedWheel
                
                break;
                
            case "CoverFlow":
                
                carousel.type  = .CoverFlow
                
                break;
                
            case "CoverFlow2":
                
                carousel.type  = .CoverFlow2
                
                break;
                
            case "TimeMachine":
                
                carousel.type  = .TimeMachine
                
                break;
                
            case "InvertedTimeMachine":
                
                carousel.type  = .InvertedTimeMachine
                
                break;
                
                
            default:
                break;
                
            }
            
            
            showCloseBtn.setTitle(carouselType[row], forSegmentAtIndex: 0)
            
            
            break;
            //END of change Carousel Type  Switch Case
            
        case 1:
            
            // START - Switch case for Row 2 - change Carousel Direction
            
            switch (shape[row]) {
                
            case "Vertical":
                
                carousel.vertical = true
                
                
                break;
                
            case "Horizontal":
                
                carousel.vertical = false
                
                break;
                
            default:
                break;
            }
            
            showCloseBtn.setTitle(shape[row], forSegmentAtIndex: 1)
            
            break;
            
        case 2:
            
            
            
            switch (size[row]) {
                
                
                
            case "0":
                
                carouselSize = 0.0
                
                
                carouselBorderWidth = 0.5
                
                
                break;
                
            case "20":
                
                carouselSize = 20.0
                
                carouselBorderWidth = 0.0
                
                
                break;
                
            case "50":
                
                
                carouselSize = 50.0
                
                carouselBorderWidth = 0.0
                
                
                break;
                
                
            case "70":
                
                carouselSize = 70.0
                
                carouselBorderWidth = 0.0
                
                
                
                break;
                
            case "100":
                
                carouselSize = 100.0
                
                carouselBorderWidth = 0.0
                
                
                
                break;
                
            case "150":
                
                carouselSize = 150.0
                
                carouselBorderWidth = 0.0
                
                
                
                break;
                
            case "200":
                
                carouselSize = 200.0
                
                carouselBorderWidth = 0.0
                
                
                
                break;
                
                
            default:
                
                break;
                
            }
            
            
            break
            //END of change Carousel Size Switch Case
            
        default:
            
            break;
            
        }
        
        
        //END of Component Row Switch Case
        
        carousel.reloadData()
        
    }
    
    
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        //intitalize the return String
        var title: String = ""
        
        //START - of Picker Text Color change - switch case
        switch (component) {
            
        case 0:
            
            title = carouselType[row]
            
            
        case 1:
            
            title = "\(shape[row])"
            
            
            
        case 2:
            
            title = "\(size[row])"
            
            
        default:
            
            break;
            
        }
        
        //End - of Picker Text Color change - switch case
        
        
        // Returning the text with the attributed color for Picker view
        
        let attributedString = NSAttributedString(string: title, attributes: [NSForegroundColorAttributeName : UIColor.redColor()])
        
        return attributedString
        
        
    }
    
    
    //MARK - iCarousel - no of Items
    
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int
    {
        
        return pageImages.count
        
    }
    
    /*     func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, reusingView view: UIView) -> UIView!
    {
    var label: UILabel! = nil
    
    
    //BOOL test = [self isKindOfClass:[SomeClass class]];
    
    
    var newView = view
    
    //create new view if no view is available for recycling
    if (newView == nil)
    {
    //don't do anything specific to the index within
    //this `if (view == nil) {...}` statement because the view will be
    //recycled and used with other index values later
    view = UIImageView(frame:CGRectMake(0, 0, 200, 200))
    (view as! UIImageView!).image = UIImage(named: "page.png")
    view.contentMode = .Center
    
    label = UILabel(frame:view.bounds)
    label.backgroundColor = UIColor.clearColor()
    label.textAlignment = .Center
    label.font = label.font.fontWithSize(50)
    label.tag = 1
    view.addSubview(label)
    }
    else
    {
    //get a reference to the label in the recycled view
    label = view.viewWithTag(1) as! UILabel!
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = "\(items[index])"
    
    return newView
    }
    */
    
    
    
    //Customising the Carouselview
    func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, reusingView view: ReflectionView!) -> UIView {
        
        var label: UILabel! = nil
        
        var newView = view
        
        var itemWidth:CGFloat! = 0.0
        var itemHeight:CGFloat! = 0.0
        
        
        //create new view if no view is available for recycling
        if (newView == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            
            // Invoking the reflection View and Change the size of View according to device width and height - This code enable the reSizing for both iPhone and iPad
            
            
            
            
            
            switch (UIDevice.currentDevice().userInterfaceIdiom) {
                
            case .Phone:
                
                
                switch (UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)) {
                    
                case true:
                    
                    //itemWidth =  self.view.frame.width/2.84
                    
                    itemHeight =  self.view.frame.height/1.5
                    
                    
                    itemWidth =  itemHeight
                    
                    
                    println(" iPhone LandsCape : Item Width: \(itemWidth) Item Height: \(itemHeight) : Screen Width: \(self.view.frame.width) : Screen Height: \(self.view.frame.height)")
                    
                    break;
                    
                case false:
                    
                    itemWidth =  self.view.frame.width/1.5
                    
                    itemHeight = itemWidth
                    
                    println(" iPhone Portait : Item Width: \(itemWidth) Item Height: \(itemHeight) : Screen Width: \(self.view.frame.width) : Screen Height: \(self.view.frame.height)")
                    
                    
                    break;
                    
                default:
                    
                    break;
                    
                }
                
                
                
                
                break;
                
            case .Pad:
                
                switch (UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)) {
                    
                case true:
                    
                    itemHeight =  self.view.frame.height/2
                    
                    
                    itemWidth =  itemHeight
                    
                    println(" iPad LandsCape : Item Width: \(itemWidth) Item Height: \(itemHeight) : Screen Width: \(self.view.frame.width) : Screen Height: \(self.view.frame.height)")
                    
                    break;
                    
                case false:
                    
                    itemWidth =  self.view.frame.width/2
                    
                    itemHeight = itemWidth
                    
                    println(" iPad Portait : Item Width: \(itemWidth) Item Height: \(itemHeight) : Screen Width: \(self.view.frame.width) : Screen Height: \(self.view.frame.height)")
                    
                    
                    break;
                    
                default:
                    
                    break;
                    
                }
                
                
                
                
                break
            default:
                break;
            }
            
            
            
            
            newView = ReflectionView(frame:CGRectMake(0, 0, itemWidth, itemHeight))
            
            
            
            
            newView.layer.borderWidth = carouselBorderWidth
            
            
            
            
            newView.layer.borderColor = UIColor.whiteColor().CGColor
            
            //newView.layer.masksToBounds = true
            
            //newView.backgroundColor = UIColor.redColor()
            
            imageView = UIImageView(frame: newView.bounds)
            
            imageView.image = UIImage(named: pageImages[index] as! String)
            
            imageView.layer.cornerRadius = carouselSize
            
            imageView.layer.masksToBounds = true
            
            
            
            /*Change content mode to fit the Image*/
            imageView.contentMode = .ScaleToFill
            
            newView.addSubview(imageView)
            
            //(newView as! ReflectionView!).image = UIImage(named: "page.png")
            newView.contentMode = .Center
            
            
            // Not used as far of now - will be sued if u want to display bale in carousel
            label = UILabel(frame:newView.bounds)
            
            label.backgroundColor = UIColor.clearColor()
            
            label.textAlignment = .Center
            
            label.font = label.font.fontWithSize(50)
            
            label.tag = 1
            
            newView.addSubview(label)
            
        } else {
            
            //get a reference to the label in the recycled view
            label = newView.viewWithTag(1) as! UILabel!
        }
        
        
        // Retun the reflection View
        return newView
        
    }
    
    
    func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
        
    {
        
        if (option == .Spacing)
        {
            
            return value * 1.1
            
        }
        
        return value
    }
    
    
    override func viewWillLayoutSubviews() {
        
        
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        carousel.reloadData()
    }
    
    
}

