//
//  ViewController.swift
//  UIKitProj
//
//  Created by David Wells on 6/16/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var roomCount: UITextField!
    @IBOutlet var keyCount: UITextField!
    @IBOutlet var enemies: UITextField!
    
    @IBOutlet var outputImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreate(_ sender: Any) {
//        print(roomCount!.text, keyCount!.text, enemies!.text)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let page2ViewController = storyboard.instantiateViewController(
          identifier: "Page2") as Page2ViewController

        navigationController?.pushViewController(
          page2ViewController, animated: true)
        
    }
    


}

