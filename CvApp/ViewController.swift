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
    var cellType: CellType
    var texte: String
    
    var niveauComp1: Int
    var texte2: String
    var niveauComp2: Int
    
}

let tableFormationsData = [
    CellData(cellType: .custom2, texte: "2017 : Formation développeur mobile iOS (3WA)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom, texte: "2007 : Certificat de développeur Java J2EE (Bac+4, Cyberlog )", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom, texte: "1998 : Certificat de réalisateur multimédia (Les Gobelins)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom, texte: "1996 : DEESCOM (Bac+3, Efficom)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom, texte: "1995 : BTS Communication et publicité (Bac+2, Iscom)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom, texte: "1993 : Bac D", niveauComp1: 0, texte2: "", niveauComp2: 0)
]

let tableExperiencesData = [
    CellData(cellType: .custom2, texte: "2012 - 2016 : VIDEODESK (flash builder, ams, javascript, html5, webrtc, github)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom2, texte: "2009 - 2012 : CONTACT & PLUS (flash builder, fms, php, sql)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom2, texte: "2009 : PHOTOBOX / MEETIC (flex, fms)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom2, texte: "2007 - 2008 : YACAST (flex, java J2EE, sql)", niveauComp1: 0, texte2: "", niveauComp2: 0),
    CellData(cellType: .custom2, texte: "1998- 2006 : MEDIAGERANCE (flash, director, photoshop, premiere, after effect…)", niveauComp1: 0, texte2: "", niveauComp2: 0)
]

let tableCompetencesData = [
    CellData(cellType: .comp, texte: "iOS", niveauComp1: 2, texte2: "ANGLAIS", niveauComp2: 4),
    CellData(cellType: .comp, texte: "FLASH BUILDER", niveauComp1: 5, texte2: "ESPAGNOL", niveauComp2: 2),
    CellData(cellType: .comp, texte: "JAVASCRIPT", niveauComp1: 3, texte2: "", niveauComp2: 0),
    CellData(cellType: .comp, texte: "PHP", niveauComp1: 2, texte2: "", niveauComp2: 0),
    CellData(cellType: .comp, texte: "JAVA J2EE", niveauComp1: 2, texte2: "", niveauComp2: 0)
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
}

// MARK: - Data Source

class MyTableViewFormationsDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //récupération du Restoration ID de la tableView
        var tableViewIdRestoration = ""
        if let tableViewId = tableView.restorationIdentifier {
            tableViewIdRestoration = tableViewId
        }
        
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
    
    func setup(with cellData: CellData) {
        textLbl.text = cellData.texte
    }
}











