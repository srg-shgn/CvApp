//
//  ViewController.swift
//  CvApp
//
//  Created by Serge Sahaguian on 19/03/2017.
//  Copyright © 2017 Serge Sahaguian. All rights reserved.
//

import UIKit

//MARK: - Modèle 

struct CellData {
    enum CellType { case custom, custom2, comp }
    var id: String
    var cellType: CellType
    var texte: String
    
    var niveauComp1: Int
    var texte2: String
    var niveauComp2: Int
    
}

let tableFormationsData = [
    CellData(id: "form_1", cellType: .custom2, texte: "2017 : Formation développeur mobile iOS (3WA)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "form_2", cellType: .custom, texte: "2007 : Certificat de développeur Java J2EE (Bac+4, Cyberlog )", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "form_3", cellType: .custom, texte: "1998 : Certificat de réalisateur multimédia (Les Gobelins)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "form_4", cellType: .custom, texte: "1996 : DEESCOM (Bac+3, Efficom)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "form_5", cellType: .custom, texte: "1995 : BTS Communication et publicité (Bac+2, Iscom)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "form_6", cellType: .custom, texte: "1993 : Bac D", niveauComp1: 0, texte2: "", niveauComp2: 0)
]

let tableExperiencesData = [
    CellData(id: "exp_1", cellType: .custom2, texte: "2012 - 2016 : VIDEODESK (flash builder, ams, javascript, html5, webrtc, github)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "exp_2", cellType: .custom2, texte: "2009 - 2012 : CONTACT & PLUS (flash builder, fms, php, sql)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "exp_3", cellType: .custom2, texte: "2009 : PHOTOBOX / MEETIC (flex, fms)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "exp_4", cellType: .custom2, texte: "2007 - 2008 : YACAST (flex, java J2EE, sql)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(id: "exp_5", cellType: .custom2, texte: "1998- 2006 : MEDIAGERANCE (flash, director, photoshop, premiere, after effect…)", niveauComp1: 0, texte2: "", niveauComp2: 0)
]

let tableCompetencesData = [
    CellData(id: "comp_1", cellType: .comp, texte: "iOS", niveauComp1: 2, texte2: "ANGLAIS", niveauComp2: 4),
    CellData(id: "comp_2", cellType: .comp, texte: "FLASH BUILDER", niveauComp1: 5, texte2: "ESPAGNOL", niveauComp2: 2),
    CellData(id: "comp_3", cellType: .comp, texte: "JAVASCRIPT", niveauComp1: 3, texte2: "", niveauComp2: 0),
    CellData(id: "comp_4", cellType: .comp, texte: "PHP", niveauComp1: 2, texte2: "", niveauComp2: 0),
    CellData(id: "comp_5", cellType: .comp, texte: "JAVA J2EE", niveauComp1: 2, texte2: "", niveauComp2: 0)
]

func getTableViewID(tableView: UITableView) -> String {
    //récupération du Restoration ID de la tableView
    if let tableViewId = tableView.restorationIdentifier {
        return tableViewId
    }
    return ""
}

// MARK: - View Controller 

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableVIewFormations: UITableView!
    @IBOutlet weak var tableViewExperiences: UITableView!
    @IBOutlet weak var tableViewCompetences: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIewFormations.delegate = self
        tableViewExperiences.delegate = self
        tableViewCompetences.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 23
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tableViewIdRestoration = getTableViewID(tableView: tableView)
        
        if tableViewIdRestoration != "experiencesTV" {
            //deselectionne la cellule, juste après qu'on ai cliqué dessus
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentExperience" {
            if let experiencenVC = segue.destination as? ExperienceViewController {
                experiencenVC.delegate = self
            }
        }
    }
}

extension ViewController: ExperienceViewControllerDelegate {
    func getSelectedExperience() -> CellData {

        //recupération de l'index de l'experience selectionnée
        let selectedExperienceItem = tableViewExperiences.indexPathForSelectedRow?.row
        //desélection de la cellule pour supprimer le fond gris
        tableViewExperiences.deselectRow(at: tableViewExperiences.indexPathForSelectedRow!, animated: false)
        
        return tableExperiencesData[selectedExperienceItem!]
    }
}

// MARK: - Data Source

class MyTableViewFormationsDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewIdRestoration = getTableViewID(tableView: tableView)
        
        var cellData: CellData
        if tableViewIdRestoration == "formationsTV" {
            cellData = tableFormationsData[indexPath.row]
        } else if tableViewIdRestoration == "experiencesTV" {
            cellData = tableExperiencesData[indexPath.row]
        } else {
            cellData = tableCompetencesData[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellData.cellType), for: indexPath)
        
        if let cell = cell as? CustomCell {
            cell.setup(with: cellData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let tableViewIdRestoration = getTableViewID(tableView: tableView)
        
        var rowCount = 0
        if tableViewIdRestoration == "formationsTV" {
            rowCount = tableFormationsData.count
        } else if tableViewIdRestoration == "experiencesTV" {
            rowCount = tableExperiencesData.count
        } else {
            rowCount = tableCompetencesData.count
        }
        
        return rowCount
    }
    
    private func identifier(for cellType: CellData.CellType) -> String {
        switch cellType {
        case .custom: return "CustomCell"
        case .custom2: return "CustomCell2"
        case .comp: return "CompetenceCell"
        }
    }
    
}


class CustomCell: UITableViewCell {
    
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var textLbl2: UILabel!
    
    @IBOutlet weak var pastille1: UIImageView!
    @IBOutlet weak var pastille2: UIImageView!
    @IBOutlet weak var pastille3: UIImageView!
    @IBOutlet weak var pastille4: UIImageView!
    @IBOutlet weak var pastille5: UIImageView!
    
    @IBOutlet weak var pastillesComp2View: UIStackView!
    
    @IBOutlet weak var pastille1_b: UIImageView!
    @IBOutlet weak var pastille2_b: UIImageView!
    @IBOutlet weak var pastille3_b: UIImageView!
    @IBOutlet weak var pastille4_b: UIImageView!
    @IBOutlet weak var pastille5_b: UIImageView!
    
    
    let pastilleVide = #imageLiteral(resourceName: "vide")
    let pastillePleine = #imageLiteral(resourceName: "plein")
    
    func setup(with cellData: CellData) {
        textLbl.text = cellData.texte
        
        if cellData.cellType == .comp {
            displayPastilleComp(niveau: cellData.niveauComp1)
            
            textLbl2.text = cellData.texte2
            if cellData.niveauComp2 == 0 {
                pastillesComp2View.isHidden = true
            } else {
                displayPastilleLangue(niveau: cellData.niveauComp2)
            }
            
        }
    }
    
    private func displayPastilleComp(niveau: Int) {
        pastille1.image = pastillePleine
        if niveau > 1 {
            pastille2.image = pastillePleine
        }
        if niveau > 2 {
            pastille3.image = pastillePleine
        }
        if niveau > 3 {
            pastille4.image = pastillePleine
        }
        if niveau > 4 {
            pastille5.image = pastillePleine
        }
    }
    
    private func displayPastilleLangue(niveau: Int) {
        pastille1_b.image = pastillePleine
        if niveau > 1 {
            pastille2_b.image = pastillePleine
        }
        if niveau > 2 {
            pastille3_b.image = pastillePleine
        }
        if niveau > 3 {
            pastille4_b.image = pastillePleine
        }
        if niveau > 4 {
            pastille5_b.image = pastillePleine
        }
    }
}











