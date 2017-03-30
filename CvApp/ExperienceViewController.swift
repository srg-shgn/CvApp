//
//  ExperienceViewController.swift
//  CvApp
//
//  Created by Serge Sahaguian on 25/03/2017.
//  Copyright © 2017 Serge Sahaguian. All rights reserved.
//

import UIKit

//MARK: - Modèle 
var tableMissionsData: [CellDataMission] = []

let tableVideodeskMissionData = [
    CellDataMission(cellType: .mission, texte: "Développement de modules intégrés dans une page html côté Front et côté BO, permettant une communication en audio/video entre les 2 interlocuteurs. Les protocoles mis en en place sont du RTMFP (peer to peer) ou RTMP (client/server/client) en fonction du réseau des utilisateurs.", envTech: "AS3, AMS, javascript, github, cloud9, pusher"),
    CellDataMission(cellType: .mission, texte: "Développement d'un module permettant de capturer le flux d'une seconde webcam côté BO, ainsi que le développement d'un module lisant ce flux côté Front.", envTech: "AS3, AMS, javascript, github, cloud9, pusher"),
    CellDataMission(cellType: .mission, texte: "Développement d'un module permettant de diffuser, via un flux video, l'écran de l'agent vers le client (screensharing), en utilisant un logiciel tiers de capture d'écran vidéo (manycam et camtwist)", envTech: "AS3, AMS, javascript, github, cloud9, manycam, camtwist, pusher"),
    CellDataMission(cellType: .mission, texte: "Développement d'un module de calcul de bande passante et de test de protocole, permettant de chosir le protocle et le mode de discussion proposé au client.", envTech: "AS3, AMS, javascript, github, cloud9, pusher"),
    CellDataMission(cellType: .mission, texte: "Développement d'un module de communication audio/video en webrtc (stun et turn)", envTech: "Webrtc, Html5 javascript, github, pusher"),
    CellDataMission(cellType: .mission, texte: "Gestion de la communication entre les modules swf (flash) et le container html (javascript)", envTech: "AS3, javascript, github, pusher"),
     CellDataMission(cellType: .mission, texte: "Correction de bug et refactoring de la solution Videodesk", envTech: "javascript, github, pusher, cloud9"),
     CellDataMission(cellType: .mission, texte: "Ajout d'un processus de transfert d'une conversation audio/vidéo avec un client Front, d'un BO 1 vers un BO 2, ainsi que la gestion de conversation à 3 entre un Front et 2 BO.", envTech: "AS3, AMS, javascript, github, cloud9, pusher")
]

let tableContactMissionData = [
    CellDataMission(cellType: .mission, texte: "Développement d'une application Ipad, tablette Android, déclinée du site web Webcamo, avec échange de messages textes et vidéos et accès aux salons et duos vidéos.", envTech: "Flex 4.6, FMS, PHP, SQL, Itune connect, Android Store"),
    CellDataMission(cellType: .mission, texte: "Création de pages dynamiques php et création de bases de données des villes de Suisse et de Belgique, dans le but d’optimiser le référencement naturel de google sur la rencontre par ville.", envTech: "PHP, SQL"),
    CellDataMission(cellType: .mission, texte: "Création d’un outil de surveillance des écrans des utilisateurs qui fréquentent les salons Webcamo, ainsi que la surveillance des échanges de messages privés entre utilisateurs dans le but de lutter contre la prostitution et la pédophilie", envTech: "Flex 4.5, FMS, PHP, SQL"),
    CellDataMission(cellType: .mission, texte: "Ajout de nouvelles rubriques et développement de nouvelles fonctionnalités avec la création de méthodes côté client(SharedObject) pour la communication entre les clients Flex, création de services PHP et création de méthode FMS.", envTech: "Flex 3, FMS, PHP, SQL"),
    CellDataMission(cellType: .mission, texte: "Création d'un outil de récupération des statistiques de connections d'un serveur FMS et stockage en base de données mySQL. Création d'un outil de récupération des statistiques de connections stockées dans une base de données et affichage sous forme de graphique (charting component).", envTech: "Flex 3, FMS, PHP, SQL"),
    CellDataMission(cellType: .mission, texte: "Ajout de nouvelles rubriques et développement de nouvelles fonctionnalités avec la création de méthodes côté client(SharedObject) pour la communication entre les clients Flex, création de services PHP et création de méthode FMS.", envTech: "Flex 3, FMS, PHP, SQL"),
    CellDataMission(cellType: .mission, texte: "Prise en main de l’application, correction des bugs existants et implémentation d'une nouvelle interface.", envTech: "Flex 3, FMS, PHP, SQL")
]

let tablePhotoboxMissionData = [
    CellDataMission(cellType: .mission, texte: "Prise en main de l’application de création des produits Photobox (livres et calendriers). Implémentation de la nouvelle interface pour les calendriers et les livres photos.", envTech: "Flex (Cairngorm), Eclipse, SVN, XML"),
    CellDataMission(cellType: .mission, texte: "Développement d'une nouvelle fonctionnalité stratégique (appelé ready made) implémentable sur tous les produits Photobox permettant de proposer aux utilisateurs des photos en rapport avec le thème choisie, et également d’avoir son produit pré-rempli avec les photos du ready made (séquence des images enregistrée dans un fichier de configuration XML)", envTech: "Flex (Cairngorm), Eclipse, SVN, XML")
]

let tableMeeticMissionData = [
    CellDataMission(cellType: .mission, texte: "Développement d’une application de gestion de photo qui permet de formaliser la taille et la compression de photos uploadées vers un serveur php. Développement côté client  avec Flex (Cairngorm), javascript    Développement côté serveur avec php (récupération des photos envoyées par le client et copie dans un répertoire du serveur).", envTech: "Flex (Cairngorm) , Javascript, CVS. Eclipse, php"),
    CellDataMission(cellType: .mission, texte: "Prise en main de l’application de chat de Meetic et  développement d’un robot de test de communication entre 2 clients. Développement côté client  avec Flex (Cairngorm), AS2, AS3. Développement côté serveur avec FMS (gestion de la communication entre l’application Flex ,les webservices et server Jabber).", envTech: "Flex (Cairngorm), Eclipse. FMS, Ejabber")
]

let tableYacastMissionData = [
    CellDataMission(cellType: .mission, texte: "Développement d’une application de gestion et d’administration d’utilisateurs et d’une application d’affichage des passages télés et radios à l’usage des artistes russes pour le calcul des droits d’auteurs-compositeurs-interprètes.", envTech: "Flex (Cairngorm, Blaze DS, Remote Object), Java/J2EE, Oracle 10, SQL, JPQL, Javascript, Talend(ETL)."),
    CellDataMission(cellType: .mission, texte: "Développement côté client  avec Flex(Cairngorm, Blaze DS Remote Object), développement côté serveur avec Java J2EE et accès à une base de donnée Oracle avec JPA (mapping  et JPQL), extraction de base de donnée.", envTech: "Flex (Cairngorm, Blaze DS, Remote Object), Java/J2EE, Oracle 10, SQL, JPQL, Javascript, Talend(ETL).")
]

let tableMediageranceMissionData = [
    CellDataMission(cellType: .mission, texte: "Développement d'application flash pour Nissan, Citroën, Renaul, Boehringr, Aubert/Duval, CIFC, Hennessy, Macif, Shoppi, Chanel…", envTech: "Flash, Photoshop, Illustrator"),
    CellDataMission(cellType: .mission, texte: "Développement d'application Director pour pour Well, Luminarc, Whirlpool, Sisley, Mercedes, Citroën, l’Oréal, Aventis, Sanofi, AFT, Prévoir, Peugeot, Carrefour, Dior, Danone, GDF, Cegetel, Cofiroute, Kerastase, Onyx, Biotherm, Escada, Michelin, Nina Ricci, Pernod, Rochas, Granini, Lalique, Dalkia, Pepsi, Hollywood, Dolce & Gabana, Van Cleef, Trussardi …", envTech: "Director, Photoshop"),
    CellDataMission(cellType: .mission, texte: "Intégration d’application, réalisation d’animation 3D et vidéo, retouche d’image pour Vichy, Coraya, Laroche, Armani, Paloma Picasso, Helena Rubinstein, Célio…", envTech: "Authorware, Director, Photoshop, Soundforge, Premiere, After Effect, 3DS Max")
]


// MARK: - View Controller

class ExperienceViewController: UIViewController, UITableViewDelegate {
    
    var delegate: ExperienceViewControllerDelegate?
    var selectedCell: CellDataExp?
    
    @IBOutlet weak var titreLbl: UILabel!
    @IBOutlet weak var periodeLbl: UILabel!
    @IBOutlet weak var sousTitreTextView: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        selectedCell = delegate?.getSelectedExperience()
        
        titreLbl.text = selectedCell?.titre
        periodeLbl.text = selectedCell?.periode
        sousTitreTextView.text = selectedCell?.sousTitre
        
        if let selectedCell = selectedCell {
            tableMissionsData = filltableMissionData(titreExp: selectedCell.titre)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellData = tableMissionsData[indexPath.row]
        let nbChars = cellData.texte.characters.count
        var rowHeight = 80
        if nbChars > 340 {
            rowHeight = 140
        }else if nbChars > 270 {
            rowHeight = 130
        } else if nbChars > 210 {
            rowHeight = 120
        } else if nbChars > 155 {
            rowHeight = 110
        } else if nbChars > 110 {
            rowHeight = 100
        } else if nbChars > 80 {
            rowHeight = 90
        }
        return CGFloat(rowHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = tableMissionsData[indexPath.row]
        print(cellData.texte.characters.count)
    }
    
    private func filltableMissionData(titreExp: String) -> [CellDataMission] {
        switch titreExp {
        case "VIDEODESK": return tableVideodeskMissionData
        case "CONTACT & PLUS": return tableContactMissionData
        case "PHOTOBOX": return tablePhotoboxMissionData
        case "MEETIC": return tableMeeticMissionData
        case "YACAST": return tableYacastMissionData
        case "MEDIAGERANCE": return tableMediageranceMissionData
        default: return tableVideodeskMissionData
        }
    }
}


protocol ExperienceViewControllerDelegate {
    func getSelectedExperience() -> CellDataExp
}


// MARK: - Data Source

class MissionTableViewDataSource: NSObject, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableMissionsData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellData: CellDataMission
        cellData = tableMissionsData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellMission", for: indexPath)
        
        if let cell = cell as? MissionCell {
            cell.setup(with: cellData)
        }
        return cell
        
    }

}

class MissionCell: UITableViewCell {
    
    @IBOutlet weak var missionTextView: UITextView!
    @IBOutlet weak var envTextView: UITextView!
    
    func setup(with cellData: CellDataMission) {
        missionTextView.text = cellData.texte
        envTextView.text = cellData.envTech
    }
}







