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

    // Keep a strong reference to the OnfidoFlow instance
    private var onfidoFlow: OnfidoFlow?
    
    @IBAction func verifyUser(_ sender: Any) {
        
        let responseHandler: (OnfidoResponse) -> Void = { response in
            
            if case let OnfidoResponse.error(innerError) = response {
                
                self.dismiss(animated: true) {
                    self.showErrorMessage(forError: innerError)
                }
                
            } else if case OnfidoResponse.success = response {
                
                self.dismiss(animated: true) {

                    let alert = UIAlertController(title: "Success", message: "Success 💪🏽", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in })
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                }
                
            } else if case OnfidoResponse.cancel = response {
                
                self.dismiss(animated: true) {
                    
                    let alert = UIAlertController(title: "Canceled", message: "Canceled by user 🤔", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in })
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                }
            }
            
        }
        
        let dobString = "1956-10-01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let dobDate = dateFormatter.date(from: dobString)!
        
        let address = Address(
            flatNumber: "308",
            street: "Adelaide Wharf",
            town: "London",
            postcode: "E2 8EZ",
            country: "GBR"
        )
        
        let applicant = Applicant.new(
            firstName: "Theresa",
            lastName: "May",
            email: "pm@number10.gov.uk",
            dateOfBirth: dobDate,
            country: "GBR",
            idNumbers: [],
            addresses: [address]
        )
        
        self.onfidoFlow = OnfidoFlow(apiToken: "YOUR_TOKEN_HERE", allowAnalytics: false)
            .and(capture: [.document, .livePhoto])
            .and(create: [.document(validate: true), .livePhoto, .applicant(applicant)])
            .and(handleResponseWith: responseHandler)
        
        do {
            
            let onfidoRun = try self.onfidoFlow!.run()
            onfidoRun.modalPresentationStyle = .formSheet
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
}
