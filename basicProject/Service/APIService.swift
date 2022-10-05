//
//  APIService.swift
//  haykoop
//
//  Created by MUHCAT on 13.09.2018.
//  Copyright © 2018 catsbilisim. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class APIService: NSObject {
    
    static fileprivate let baseURL = "http://88.250.189.36:82/api/"//"http://ha724.cankayadd.com:8880/api/"
    static fileprivate let weatherApiBaseURL = "http://api.openweathermap.org/data/2.5/forecast/daily?appid=1487dd8a93bfd85d278d9ac8dcfee94c"
    
    static fileprivate let newsURL          = "Haber"
    static fileprivate let announcementURL  = "Duyuru"
    static fileprivate let writerURL        = "Yazar"
    static fileprivate let videoURL         = "Video"
    static fileprivate let galleryURL       = "Galeri"
    static fileprivate let journalURL       = "DergilerRecep"
    static fileprivate let postsURL         = "Makale"
    static fileprivate let ilceURL          = "ilce"
    static fileprivate let mahalleURL       = "Mahalle"
    static fileprivate let koopURL          = "Koop"
    static fileprivate let kkayitURL        = "KullaniciKayit"
    static fileprivate let SifreSifirlaURL  = "SifreSifir"
    static fileprivate let GirisURL         = "Giris"
    static fileprivate let KupeURL          = "Kupe"
    static fileprivate let KupeList         = "KupeList"
    static fileprivate let KartURL          = "Kart"
    static fileprivate let KartListURL      = "KartList"
    static fileprivate let KullaniciUpdate  = "Kullanici"
    static fileprivate let TelefonKontrolURL = "Telefon"
    static fileprivate let UID = "UID"
    
    typealias APIServiceCompletionHandler = (JSON?, APIError?) -> ()
    
    static func requestIlce(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: ilceURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestMahalle(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let newMahalleURL = "\(mahalleURL)?ilce=\(LocalStorageService.value(forKey: .ilceIdSP) ?? "")"
        
        let url = URL(string: newMahalleURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestKooperatif(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let newKoopURL = "\(koopURL)?ilce=\(LocalStorageService.value(forKey: .ilceIdSP) ?? "")"
        
        let url = URL(string: newKoopURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestSifreSifirla(completionHandler: @escaping APIServiceCompletionHandler) {
        
        var sifirParam = UserDefaults.standard.string(forKey: "TC")
        
        if(sifirParam == nil || sifirParam == "")
        {
            sifirParam = LocalStorageService.value(forKey: .Telefon) as? String
        }
        
        let sifreURL = "\(SifreSifirlaURL)?tc=\(sifirParam ?? "")"
        
        let url = URL(string: sifreURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestTelefonSorgu(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let sifreURL = "\(TelefonKontrolURL)?tc=\(LocalStorageService.value(forKey: .TC) ?? "")"
        
        let url = URL(string: sifreURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestTelefonKaydet(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let sifreURL = "\(TelefonKontrolURL)?tc=\(LocalStorageService.value(forKey: .TC) ?? "")"
        
        let url = URL(string: sifreURL, relativeTo: URL(string: baseURL))!
        
        putJson(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestGiris(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let girisURL = "\(GirisURL)?tc=\(LocalStorageService.value(forKey: .TC) ?? "")&sifre=\(LocalStorageService.value(forKey: .sifre) ?? "")"
        
        let url = URL(string: girisURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestKupeBasvurulari(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let kupeListURL = "\(KupeList)?mobil_id=\(LocalStorageService.value(forKey: .KullaniciId) ?? "")"
        
        let url = URL(string: kupeListURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestKartBasvurulari(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let kartListURL = "\(KartListURL)?mobil_id=\(LocalStorageService.value(forKey: .KullaniciId) ?? "")"
        
        let url = URL(string: kartListURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestKullaniciKayit(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: kkayitURL, relativeTo: URL(string: baseURL))!
        
        postJson(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestKullaniciUpdate(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let kupdateURL = "\(KullaniciUpdate)/\(LocalStorageService.value(forKey: .KullaniciId) ?? "")"
        
        let url = URL(string: kupdateURL, relativeTo: URL(string: baseURL))!
        
        putJsonKullaniciUpdate(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestFcmTokenUpdate(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let kupdateURL = "\(UID)/\(LocalStorageService.value(forKey: .KullaniciId) ?? "")"
        
        let url = URL(string: kupdateURL, relativeTo: URL(string: baseURL))!
        
        putJson(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestKupeBasvuru(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: KupeURL, relativeTo: URL(string: baseURL))!
        
        postJson(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestKartBasvuru(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: KartURL, relativeTo: URL(string: baseURL))!
        
        postJson(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestHavadurumu(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let wUrl = "\(weatherApiBaseURL)&id=\(LocalStorageService.value(forKey: .ilceIdForWApi) ?? "")&units=metric&lang=tr"
        
        let url = URL(string: wUrl)!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestNews(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: newsURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestAnnouncement(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: announcementURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestWriter(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: writerURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestVideo(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: videoURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestGallery(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: galleryURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestJournal(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: journalURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    static func requestPosts(completionHandler: @escaping APIServiceCompletionHandler) {
        
        let url = URL(string: postsURL, relativeTo: URL(string: baseURL))!
        
        request(to: url, withParameters: Parameters()) { (r, e) in
            completionHandler(r, e)
        }
    }
    
    private static func request(to url: URL, withParameters params: Parameters, completionHandler: @escaping APIServiceCompletionHandler) {
        
        let parameters: Parameters = extend(params: params, url: url, method: .get)
        
        let newURL = url.absoluteString
        let newURLss = "\(newURL)"
        
        
        print("\(newURL) -> sent parameters \(parameters)")
        /*let req = AF.request(URL(string: newURL)!, method: .get, parameters: parameters, encoder: URLEncoding.httpBody, headers: nil, interceptor: nil, requestModifier: nil)
        
        req.responseJSON { response in
            response.result
        }
        */
        let newURLs="http://88.250.189.36:82/api/Haber"
        AF.request(URL(string: newURLss)!, method: .get, parameters: nil, encoding: URLEncoding.httpBody)
         
            
            .responseString { response in
                //print("response \(String(describing: response.result.value))")
            }
            
            .responseJSON { response in
                
               
            
                switch response.result {
                case .success(let value):
                    
                    //print("Response JSON: \(String(describing: response.result.value))")
                    /*
                    if let jsonValue = value {
                        
                        let json = JSON(jsonValue)
                        
                        completionHandler(json, nil)
                        
                    } else {
                        completionHandler(nil, .missingParameters)
                        
                    }*/
                    let json = JSON(value)
                                           
                    completionHandler(json, nil)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(nil, .responseUnsuccessful)
                    
                }
        }
    }
    
    private static func postJson(to url: URL, withParameters params: Parameters, completionHandler: @escaping APIServiceCompletionHandler) {
        
        let parameters: Parameters = extend(params: params, url: url)
        
        let newURL = url.absoluteString
        
        print("\(newURL) -> sent parameters \(parameters)")
        
        AF.request(URL(string: newURL)!, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            
            .responseString { response in
                
                
                switch response.result {
                case .success(let value):
                    if response.response?.statusCode == 200
                    {
                        let json = JSON("ok")
                     
                        completionHandler(json, nil)
                    }else
                    {
                        let json = JSON("404")
                                           
                        completionHandler(json, nil)
                    }
                case .failure(let error):
                    
                    let json = JSON("error")
                    completionHandler(json, nil)
                }
                
                /*
                print("response \(String(describing: response.result.value))")
                print("Success: \(response.result)")
                print("Success: \(response.response?.statusCode)")
                
                if(response.result.isSuccess == true && response.response?.statusCode == 200)
                {
                    let json = JSON("ok")
                    
                    completionHandler(json, nil)
                }
                if(response.response?.statusCode == 404)
                {
                    let json = JSON("404")
                    
                    completionHandler(json, nil)
                }
                else
                {
                    let json = JSON("error")
                    
                    completionHandler(json, nil)
                }*/
            }
            
            
    }
    
    private static func putJson(to url: URL, withParameters params: Parameters, completionHandler: @escaping APIServiceCompletionHandler) {
        
        let parameters: Parameters = extend(params: params, url: url)
        
        let newURL = url.absoluteString
        
        print("\(newURL) -> sent parameters \(parameters)")
        
        AF.request(URL(string: newURL)!, method: .put, parameters: parameters, encoding: URLEncoding.httpBody)
            
            .responseString { response in
                /*print("response \(String(describing: response.result.value))")
                print("Success: \(response.result.isSuccess)")
                print("Success: \(response.response?.statusCode)")
                */
                switch response.result {
                                case .success(let value):
                                    if response.response?.statusCode == 200
                                    {
                                        let json = JSON("ok")
                                     
                                        completionHandler(json, nil)
                                    }
                                case .failure(let error):
                                    
                                    let json = JSON("error")
                                    completionHandler(json, nil)
               }
                
              
        }
        
        
    }
    
    private static func putJsonKullaniciUpdate(to url: URL, withParameters params: Parameters, completionHandler: @escaping APIServiceCompletionHandler) {
        
        let parameters: Parameters = extend(params: params, url: url)
        
        let newURL = url.absoluteString
        
        print("\(newURL) -> sent parameters \(parameters)")
        
        AF.request(URL(string: newURL)!, method: .put, parameters: parameters, encoding: URLEncoding.httpBody)
            
            .responseString { response in
                /*print("response \(String(describing: response.result.value))")
                print("Success: \(response.result.isSuccess)")
                print("Success: \(response.response?.statusCode)")
                
                let json = JSON(response.result.value)
                
                completionHandler(json, nil)*/
        }
        
            .responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    
                    //print("Response JSON: \(String(describing: response.result.value))")
                    /*
                    if let jsonValue = value {
                        
                        let json = JSON(jsonValue)
                        
                        completionHandler(json, nil)
                        
                    } else {
                        completionHandler(nil, .missingParameters)
                        
                    }
                    */
                    
                    let json = JSON(value)
                    
                    completionHandler(json, nil)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(nil, .responseUnsuccessful)
                    
                }
        }
    }
    
    private static func extend(params: Parameters, url: URL, method: HTTPMethod = .put) -> Parameters {
        
        var tempParams = params
        
        var reqURL = url.absoluteString
        let reqType = reqURL.replacingOccurrences(of: baseURL, with: "")
        print(reqType)
        switch reqType {
        case "KullaniciKayit":
            tempParams["AdSoyad"] = UserDefaults.standard.string(forKey: "AdSoyad") //LocalStorageService.value(forKey: .AdSoyad)
            tempParams["TC"]      = UserDefaults.standard.string(forKey: "TC") //LocalStorageService.value(forKey: .TC)
            tempParams["RolID"]   = LocalStorageService.value(forKey: .RolID)
            tempParams["Email"]   = LocalStorageService.value(forKey: .Email)
            tempParams["Telefon"] = UserDefaults.standard.string(forKey: "Telefon") //LocalStorageService.value(forKey: .Telefon)
            tempParams["KoopID"]  = LocalStorageService.value(forKey: .KoopID)
            tempParams["KisiNo"]  = LocalStorageService.value(forKey: .KisiNo)
            tempParams["IlceID"]  = LocalStorageService.value(forKey: .IlceId)
            tempParams["KoyID"]   = LocalStorageService.value(forKey: .mahalleId)
        case "Kupe":
            tempParams["MobilID"] = LocalStorageService.value(forKey: .KullaniciId)
            tempParams["IsletmeNo"]      = LocalStorageService.value(forKey: .IsletmeNo)
            tempParams["DogNo"]   = LocalStorageService.value(forKey: .DogNo)
            tempParams["DogTarih"]   = LocalStorageService.value(forKey: .DogTarih)
            tempParams["CinsiyetID"] = LocalStorageService.value(forKey: .CinsiyetID)
            tempParams["IrkID"] = LocalStorageService.value(forKey: .IrkID)
            
        case "Kart":
            tempParams["MobilID"] = LocalStorageService.value(forKey: .KullaniciId)
            
        default:
            if(reqType.contains("Kullanici"))
            {
                tempParams["AdSoyad"] = LocalStorageService.value(forKey: .AdSoyad)
                tempParams["TC"]      = LocalStorageService.value(forKey: .TC)
                tempParams["Email"]   = LocalStorageService.value(forKey: .Email)
                tempParams["Telefon"] = LocalStorageService.value(forKey: .Telefon)
                tempParams["KoopID"]  = LocalStorageService.value(forKey: .KoopID)
                tempParams["KisiNo"]  = LocalStorageService.value(forKey: .KisiNo)
                tempParams["IlceID"]  = LocalStorageService.value(forKey: .IlceId)
                tempParams["KoyID"]   = LocalStorageService.value(forKey: .mahalleId)
                tempParams["Sil"]     = false
                tempParams["UID"]     = LocalStorageService.value(forKey: .UIDNo)
                tempParams["Sifre"]   = LocalStorageService.value(forKey: .sifre)
            }
            else if(reqType.contains("Telefon") && method == .put)
            {
                tempParams["Telefon"] = LocalStorageService.value(forKey: .Telefon)
            }
            else if(reqType.contains("UID") && method == .put)
            {
                tempParams["UID"] = LocalStorageService.value(forKey: .fcmTokenParam)
            }
            else
            {
               tempParams = params
            }
            
        }
        //tempParams["dergi_id"] = LocalStorageService.value(forKey: .journalId)
        //tempParams["dil"] = LocalStorageService.value(forKey: .language)
        
        //tempParams["deviceId"] = UtilityService.deviceId()
        //tempParams["deviceToken"] = UtilityService.deviceToken()
        //tempParams["localeIdentifier"] = UtilityService.localeIdentifier()
        //tempParams["platform"] = UtilityService.deviceModel()
        //tempParams["appVersion"] = UtilityService.appVersion()
        
        return tempParams
    }
    
}

