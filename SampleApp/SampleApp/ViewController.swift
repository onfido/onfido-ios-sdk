//
//  ViewController.swift
//  SampleApp
//
//  Created by Anurag Ajwani on 09/03/2017.
//  Copyright © 2017 example. All rights reserved.
//

import UIKit
import Onfido
import Alamofire

final class ViewController: UIViewController {

    private let token = "YOUR_TOKEN_HERE"
    
    @IBAction func verifyUser(_ sender: Any) {
        
        self.createApplicant { (applicantId, error) in
            
            guard error == nil else {
                self.showErrorMessage(forError: error!)
                return
            }
            
            self.runFlow(forApplicantWithId: applicantId!)
        }
    }
    
    private func runFlow(forApplicantWithId applicantId: String) {
        
        let responseHandler: (OnfidoResponse) -> Void = { response in
            
            if case let OnfidoResponse.error(innerError) = response {
                
                self.showErrorMessage(forError: innerError)
                
            } else if case OnfidoResponse.success = response {
                    
                let alert = UIAlertController(title: "Success", message: "Success", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in })
                alert.addAction(alertAction)
                self.present(alert, animated: true)
                
            } else if case OnfidoResponse.cancel = response {
                
                let alert = UIAlertController(title: "Canceled", message: "Canceled by user", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in })
                alert.addAction(alertAction)
                self.present(alert, animated: true)
            }
            
        }
        
        let config = try! OnfidoConfig.builder()
            .withToken(token)
            .withApplicantId(applicantId)
            .withDocumentStep()
            .withFaceStep(ofVariant: .photo)
            .build()
        
        let onfidoFlow = OnfidoFlow(withConfiguration: config)
            .with(responseHandler: responseHandler)
        
        do {
            
            let onfidoRun = try onfidoFlow.run()
            onfidoRun.modalPresentationStyle = .formSheet // to present modally
            self.present(onfidoRun, animated: true, completion: nil)
            
        } catch let error {
            
            // cannot execute the flow
            // check CameraPermissions
            self.showErrorMessage(forError: error)
        }
    }
    
    private func showErrorMessage(forError error: Error) {
        
        let alert = UIAlertController(title: "Errored", message: "Onfido SDK Errored \(error)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in })
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    /**
     Creates applicant
     
     - parameter completionHandler: closure to be executed once the applicant id is received or an error is encountered in the creation process
    */
    private func createApplicant(_ completionHandler: @escaping (String?, Error?) -> Void) {
    
        /**
         Note: support for Applicant creation during the Onfido iOS SDK flow is deprecated
         We suggest to create applicants in your backend
        */
        
        let applicant: Parameters = [
            "first_name": "Theresa",
            "last_name": "May"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Token token=\(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request(
            "https://api.onfido.com/v2/applicants",
            method: .post,
            parameters: applicant,
            encoding: JSONEncoding.default,
            headers: headers).responseJSON { (response: DataResponse<Any>) in
            
                guard response.error == nil else {
                    completionHandler(nil, response.error)
                    return
                }
                
                let response = response.result.value as! [String: Any]
                
                guard response.keys.contains("error") == false else {
                    completionHandler(nil, ApplicantError.apiError(response["error"] as! [String : Any]))
                    return
                }
                
                let applicantId = response["id"] as! String
                completionHandler(applicantId, nil)
        }
    }
}
enum ApplicantError: Error {
    case apiError([String:Any])
}
