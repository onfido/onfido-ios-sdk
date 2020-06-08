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
        
    @IBAction func verifyUser(_ sender: Any) {
        
        let responseHandler: (OnfidoResponse) -> Void = { response in
            
            if case let OnfidoResponse.error(innerError) = response {
                self.showErrorMessage(forError: innerError)
            } else if case OnfidoResponse.success = response {
                // SDK flow has been completed successfully. You may want to create a check in your backend at this point.
                // Follow https://github.com/onfido/onfido-ios-sdk#2-creating-a-check to understand how to create a check
                let alert = UIAlertController(title: "Success", message: "SDK flow has been completed successfully", preferredStyle: .alert)
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
        
        // TODO Call your backend to get `sdkToken` https://github.com/onfido/onfido-ios-sdk#31-sdk-tokens
        let sdkToken: String = "SDK_TOKEN"
        
        let config = try! OnfidoConfig.builder()
            .withSDKToken(sdkToken)
            .withWelcomeStep()
            .withDocumentStep()
            .withFaceStep(ofVariant: .photo(withConfiguration: nil))
            .build()
        
        let onfidoFlow = OnfidoFlow(withConfiguration: config)
            .with(responseHandler: responseHandler)
        
        do {
            let onfidoRun = try onfidoFlow.run()
           
            /*
             Supported presentation styles are:
             For iPhones: .fullScreen
             For iPads: .fullScreen and .formSheet
             */
            var modalPresentationStyle: UIModalPresentationStyle = .fullScreen  // due to iOS 13 you must specify .fullScreen as the default is now .pageSheet
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                modalPresentationStyle = .formSheet // to present modally on iPads
            }
            
            onfidoRun.modalPresentationStyle = modalPresentationStyle
            self.present(onfidoRun, animated: true, completion: nil)
        } catch let error {
            // cannot execute the flow
            self.showErrorMessage(forError: error)
        }
    }
    
    private func showErrorMessage(forError error: Error) {
        let alert = UIAlertController(title: "Error", message: "Onfido SDK errored \(error)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in })
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
