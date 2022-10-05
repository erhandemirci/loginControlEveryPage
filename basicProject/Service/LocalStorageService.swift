//
//  LocalStorageService.swift
//  haykoop
//
//  Created by MUHCAT on 13.09.2018.
//  Copyright © 2018 catsbilisim. All rights reserved.
//

import UIKit

enum Key {
    
    case journalId
    case language
    case deviceToken
    case journalDate
    case canliYayin
    case IlceId
    case mahalleId
    
    case AdSoyad
    case TC
    case RolID
    case Email
    case Telefon
    case KoopID
    case KisiNo
    case sifre
    case KullaniciId
    case GirisYapan
    case Irk
    case IrkID
    
    //Kupe başvurusu
    case IsletmeNo
    case DogNo
    case DogTarih
    case CinsiyetID
    
    case UIDNo
    
    case ilceIdSP
    case mahIdSP
    case koopIdSP
    
    case notfWVTitle
    case notfWVLink
    
    case fcmToken
    case fcmTokenParam
    
    case ilceIdForWApi
}

struct KeyString {
    
    private static var namesForKeys: [Key: String] = [
        
        Key.journalId: "journalId",
        Key.language: "language",
        Key.deviceToken: "deviceToken",
        Key.journalDate: "journalDate",
        Key.canliYayin:"canliYayin",
        Key.IlceId: "ilce",
        Key.mahalleId: "koy",
        Key.AdSoyad : "AdSoyad",
        Key.TC : "TC",
        Key.RolID : "RolID",
        Key.Email : "Email",
        Key.Telefon : "Telefon",
        Key.KoopID : "KoopID",
        Key.KisiNo : "KisiNo",
        Key.sifre : "sifre",
        Key.KullaniciId: "MobilID",
        Key.GirisYapan: "GirisYapan",
        Key.Irk: "Irk",
        Key.IrkID: "IrkID",
        
        //Küpe başvurusu
        Key.IsletmeNo: "IsletmeNo",
        Key.DogNo: "DogNo",
        Key.DogTarih: "DogTarih",
        Key.CinsiyetID: "CinsiyetID",
        
        Key.UIDNo: "UID",
        
        Key.ilceIdSP: "ilceIdSP",
        Key.mahIdSP: "mahIdSP",
        Key.koopIdSP: "koopIdSP",
        
        Key.notfWVTitle: "notfWVTitle",
        Key.notfWVLink: "notfWVLink",
        Key.fcmToken: "fcmToken",
        Key.fcmTokenParam: "fcmTokenParam",
        Key.ilceIdForWApi: "ilceIdForWApi"
        
    ]
    
    static func name(forKey key: Key) -> String {
        
        guard let name = namesForKeys[key] else {
            print("There is no name for key: '\(key)'!")
            return ""
        }
        
        return name
    }
}

class LocalStorageService: NSObject {
    
    static func set(value: Any?, forKey key: Key) {
        UserDefaults.standard.set(value, forKey: KeyString.name(forKey: key))
    }
    
    static func value(forKey key: Key) -> Any? {
        return UserDefaults.standard.value(forKey:KeyString.name(forKey: key))
    }
}

