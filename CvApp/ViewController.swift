//
//  ViewController.swift
//  CvApp
//
//  Created by Serge Sahaguian on 19/03/2017.
//  Copyright © 2017 Serge Sahaguian. All rights reserved.
//

import UIKit

//MARK: - Modèle 

struct CellFormationData {
    enum CellType { case custom, custom2 }
    var cellType: CellType
    var texte: String
}

struct CellCompetencesnData {
    enum CellType { case comp, comp2 }
    var cellType: CellType
    var competence1: String
    var niveauComp1: Int
    var competence2: String
    var niveauComp2: Int
}

let tableFormationsData = [
    CellFormationData(cellType: .custom2, texte: "2017 : Formation développeur mobile iOS (3WA)"),
    CellFormationData(cellType: .custom, texte: "2007 : Certificat de développeur Java J2EE (Bac+4, Cyberlog )"),
    CellFormationData(cellType: .custom, texte: "1998 : Certificat de réalisateur multimédia (Les Gobelins)"),
    CellFormationData(cellType: .custom, texte: "1996 : DEESCOM (Bac+3, Efficom)"),
    CellFormationData(cellType: .custom, texte: "1995 : BTS Communication et publicité (Bac+2, Iscom)"),
    CellFormationData(cellType: .custom, texte: "1993 : Bac D")
]

let tableExperiencesData = [
    CellFormationData(cellType: .custom2, texte: "2012 - 2016 : VIDEODESK (flash builder, ams, javascript, html5, webrtc, github)"),
    CellFormationData(cellType: .custom2, texte: "2009 - 2012 : CONTACT & PLUS (flash builder, fms, php, sql)"),
    CellFormationData(cellType: .custom2, texte: "2009 : PHOTOBOX / MEETIC (flex, fms)"),
    CellFormationData(cellType: .custom2, texte: "2007 - 2008 : YACAST (flex, java J2EE, sql)"),
    CellFormationData(cellType: .custom2, texte: "1998- 2006 : MEDIAGERANCE (flash, director, photoshop, premiere, after effect…)")
]

let tableCompetencesData = [
    CellCompetencesnData(cellType: .comp, competence1: "iOS", niveauComp1: 2, competence2: "ANGLAIS", niveauComp2: 4),
    CellCompetencesnData(cellType: .comp, competence1: "FLASH BUILDER", niveauComp1: 5, competence2: "ESPAGNOL", niveauComp2: 2),
    CellCompetencesnData(cellType: .comp, competence1: "JAVASCRIPT", niveauComp1: 3, competence2: "", niveauComp2: 0),
    CellCompetencesnData(cellType: .comp, competence1: "PHP", niveauComp1: 2, competence2: "", niveauComp2: 0),
    CellCompetencesnData(cellType: .comp, competence1: "JAVA J2EE", niveauComp1: 2, competence2: "", niveauComp2: 0)
]

// MARK: - View Controller 

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableVIewFormations: UITableView!
    @IBOutlet weak var tableViewExperiences: UITableView!
    @IBOutlet weak var tableViewCompetences: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIewFormations.delegate = self
        tableViewExperiences.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 23
    }
}

// MARK: - Data Source

class MyTableViewFormationsDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //récupération du Restoration ID de la tableView
        var tableViewIdRestoration = ""
        if let tableViewId = tableView.restorationIdentifier {
            tableViewIdRestoration = tableViewId
        }
        
        var cellData: CellFormationData
        if tableViewIdRestoration == "formationsTV" {
            cellData = tableFormationsData[indexPath.row]
        } else {
            cellData = tableExperiencesData[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier(for:cellData.cellType), for: indexPath)
        
        if let cell = cell as? CustomCell {
            cell.setup(with: cellData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //récupération du Restoration ID de la tableView
        var tableViewIdRestoration = ""
        if let tableViewId = tableView.restorationIdentifier {
            tableViewIdRestoration = tableViewId
        }
        
        var rowCount = 0
        if tableViewIdRestoration == "formationsTV" {
            rowCount = tableFormationsData.count
        } else {
            rowCount = tableExperiencesData.count
        }
        
        return rowCount
    }
    
    private func identifier(for cellType: CellFormationData.CellType) -> String {
        switch cellType {
        case .custom: return "CustomCell"
        case .custom2: return "CustomCell2"
        }
    }
    
}


class CustomCell: UITableViewCell {
    
    @IBOutlet weak var textLbl: UILabel!
    
    func setup(with cellData: CellFormationData) {
        textLbl.text = cellData.texte
    }
}

class CompetenceCell: UITableViewCell {
    
    func setup(with cellData: CellCompetencesnData) {
        
    }
}










