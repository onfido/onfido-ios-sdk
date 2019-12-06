//
//  ViewController.swift
//  SampleApp
//
//  Created by Anurag Ajwani on 09/03/2017.
//  Copyright © 2017 example. All rights reserved.
//

import UIKit
import Onfido

final class ViewController: UIViewController {

    private let token = "YOUR_TOKEN_HERE"
    
    @IBAction func verifyUser(_ sender: Any) {
        
        self.createApplicant { (applicantId, error) in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    self.showErrorMessage(forError: error!)
                    return
                }
                
                self.runFlow(forApplicantWithId: applicantId!)
            }
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
            .withWelcomeStep()
            .withDocumentStep()
            .withFaceStep(ofVariant: .photo(withConfiguration: nil))
            .build()
        
        let onfidoFlow = OnfidoFlow(withConfiguration: config)
            .with(responseHandler: responseHandler)
        
        do {
            
            let onfidoRun = try onfidoFlow.run()
            onfidoRun.modalPresentationStyle = UIDevice.current.userInterfaceIdiom == .pad ? .formSheet : .fullScreen // to present modally on iPads
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
        
        let defaultSessionConfiguration = URLSessionConfiguration.default
        let defaultSession = URLSession(configuration: defaultSessionConfiguration)
        
        let url = URL(string: "https://api.onfido.com/v2/applicants")
        var urlRequest = URLRequest(url: url!)
        
        let postParams = "first_name=Theresa&last_name=May"
        let postData = postParams.data(using: .utf8)
        
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = postData
        urlRequest.addValue("Token token=\(token)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

        let dataTask = defaultSession.dataTask(with: urlRequest) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            if statusCode >= 200, statusCode <= 299, let responseData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: responseData, options: []) as! [String : Any]
                    guard json.index(forKey: "error") == nil else {
                        completionHandler(nil, ApplicantError.apiError(json["error"] as! [String : Any]))
                        return
                    }
                    let applicantId = json["id"] as! String
                    completionHandler(applicantId, nil)
                } catch {
                    completionHandler(nil, ApplicantError.apiError(["exception": error.localizedDescription]))
                }
            } else {
                completionHandler(nil, ApplicantError.apiError(["Http Error": "Response Code: \(statusCode)"]))
            }
        }
        
        dataTask.resume()
        
    }
}
enum ApplicantError: Error {
    case apiError([String:Any])
}
