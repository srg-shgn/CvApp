//
//  ExperienceViewController.swift
//  CvApp
//
//  Created by Serge Sahaguian on 25/03/2017.
//  Copyright © 2017 Serge Sahaguian. All rights reserved.
//

import UIKit

class ExperienceViewController: UIViewController {
    
    var delegate: ExperienceViewControllerDelegate?
    var selectedCell: CellDataExp?
    
    @IBOutlet weak var titreLbl: UILabel!
    @IBOutlet weak var periodeLbl: UILabel!
    @IBOutlet weak var sousTitreTextView: UITextView!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedCell = delegate?.getSelectedExperience()
        
        titreLbl.text = selectedCell?.titre
        periodeLbl.text = selectedCell?.periode
        sousTitreTextView.text = selectedCell?.sousTitre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


protocol ExperienceViewControllerDelegate {
    func getSelectedExperience() -> CellDataExp
}
