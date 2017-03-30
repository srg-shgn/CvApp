//
//  ViewController.swift
//  CvApp
//
//  Created by Serge Sahaguian on 19/03/2017.
//  Copyright © 2017 Serge Sahaguian. All rights reserved.
//

import UIKit

//MARK: - Modèle 

class CellData {
    enum CellType { case custom, custom2, comp, mission, missionXL }
    var cellType: CellType
    var texte: String = ""
    
    init(cellType: CellType, texte: String) {
        self.cellType = cellType
        self.texte = texte
    }
}

class CellDataExp: CellData {
    var titre: String = ""
    var periode: String = ""
    var sousTitre: String = ""
    
    init(cellType: CellType, texte: String, titre: String, periode: String, sousTitre: String) {
        super.init(cellType: cellType, texte: texte)
        self.titre = titre
        self.periode = periode
        self.sousTitre = sousTitre
    }
}

class CellDataComp: CellData {
    var niveauComp1: Int = 0
    var texte2: String = ""
    var niveauComp2: Int = 0
    
    init(cellType: CellType, texte: String, niveauComp1: Int, texte2: String, niveauComp2: Int) {
        super.init(cellType: cellType, texte: texte)
        self.niveauComp1 = niveauComp1
        self.texte2 = texte2
        self.niveauComp2 = niveauComp2
    }
}

class CellDataMission: CellData {
    var envTech: String = ""
    init(cellType: CellType, texte: String, envTech: String) {
        super.init(cellType: cellType, texte: texte)
        self.envTech = envTech
    }
}

let tableFormationsData = [
    CellData(cellType: .custom2, texte: "2017 : Formation développeur mobile iOS (3WA)"),
    CellData(cellType: .custom, texte: "2007 : Certificat de développeur Java J2EE (Bac+4, Cyberlog)"),
    CellData(cellType: .custom, texte: "2000 - 2001 : IHM et Bases de données Oracle (Cnam)"),
    CellData(cellType: .custom, texte: "1998 : Certificat de réalisateur multimédia (Les Gobelins)"),
    CellData(cellType: .custom, texte: "1996 : DEESCOM (Bac+3, Efficom)"),
    CellData(cellType: .custom, texte: "1995 : BTS Communication et publicité (Bac+2, Iscom)"),
    CellData(cellType: .custom, texte: "1993 : Bac D")
]

let tableExperiencesData = [
    CellDataExp(cellType: .custom2, texte: "2012 - 2016 : VIDEODESK (flash builder, ams, javascript, html5, webrtc, github)", titre: "VIDEODESK", periode: "2012 - 2016 : 49 mois", sousTitre: "(flash builder, ams, javascript, html5, webrtc, github)"),
    CellDataExp(cellType: .custom2, texte: "2009 - 2012 : CONTACT & PLUS (flash builder, fms, php, sql)", titre: "CONTACT & PLUS", periode: "2009 - 2012 : 30 mois", sousTitre: "(flash builder, fms, php, sql)"),
    CellDataExp(cellType: .custom2, texte: "2009 : PHOTOBOX (flex, fms)", titre: "PHOTOBOX", periode: "2009 : 3 mois", sousTitre: "(flex, fms)"),
    CellDataExp(cellType: .custom2, texte: "2009 : MEETIC (flex, fms)", titre: "MEETIC", periode: "2009 : 5 mois", sousTitre: "(flex, fms)"),
    CellDataExp(cellType: .custom2, texte: "2007 - 2008 : YACAST (flex, java J2EE, sql)", titre: "YACAST", periode:"2007 - 2008 : 13 mois", sousTitre: "(flex, java J2EE, sql)"),
    CellDataExp(cellType: .custom2, texte: "1998- 2006 : MEDIAGERANCE (flash, director, photoshop, premiere, after effect…)", titre: "MEDIAGERANCE", periode: "1998- 2006 : 8 ans",  sousTitre: "(flash, director, photoshop, premiere, after effect…)")
]

let tableCompetencesData = [
    CellDataComp(cellType: .comp, texte: "iOS", niveauComp1: 2, texte2: "ANGLAIS", niveauComp2: 4),
    CellDataComp(cellType: .comp, texte: "FLASH BUILDER", niveauComp1: 5, texte2: "ESPAGNOL", niveauComp2: 2),
    CellDataComp(cellType: .comp, texte: "JAVASCRIPT", niveauComp1: 3, texte2: "", niveauComp2: 0),
    CellDataComp(cellType: .comp, texte: "PHP", niveauComp1: 2, texte2: "", niveauComp2: 0),
    CellDataComp(cellType: .comp, texte: "JAVA J2EE", niveauComp1: 2, texte2: "", niveauComp2: 0)
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
    func getSelectedExperience() -> CellDataExp {

        //recupération de l'index de l'experience selectionnée
        let selectedExperienceItem = tableViewExperiences.indexPathForSelectedRow?.row
        //desélection de la cellule pour supprimer le fond gris
        tableViewExperiences.deselectRow(at: tableViewExperiences.indexPathForSelectedRow!, animated: false)
        
        return tableExperiencesData[selectedExperienceItem!]
    }
}

// MARK: - Data Source

class MyTableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewIdRestoration = getTableViewID(tableView: tableView)
        
        var cellData: CellData
        if tableViewIdRestoration == "formationsTV" {
            cellData = tableFormationsData[indexPath.row]
        } else if tableViewIdRestoration == "experiencesTV" {
            cellData = tableExperiencesData[indexPath.row] as CellDataExp
        } else {
            cellData = tableCompetencesData[indexPath.row] as CellDataComp
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
        case .mission: return "MissionCell"
        case .missionXL: return "MissionCell"
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
    
    //func setup(with cellData: CellData) {
    func setup(with cellData: AnyObject) {
        
        let cellData = cellData as! CellData
        textLbl.text = cellData.texte
        
        if cellData.cellType == .comp {
            let cellData = cellData as! CellDataComp
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











