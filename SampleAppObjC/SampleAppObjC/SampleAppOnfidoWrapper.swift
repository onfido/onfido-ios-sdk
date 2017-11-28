//
//  SampleAppOnfidoWrapper.swift
//  SampleAppObjC
//
//  Created by Anurag Ajwani on 22/11/2017.
//  Copyright © 2017 onfido. All rights reserved.
//

import Foundation
import Onfido
import Alamofire

@objc
protocol SampleAppOnfidoWrapperDelegate: class {
    
    /**
     Tells the delegate that the onfido flow ran successfully and an applicant
     was created
     
     - parameter applicantId: A string that identifies an applicant in Onfido
    */
    func success(forApplicantWithId applicantId: String)
    
    /**
     Tells the delegate that an error was encountered previous or during the flow execution
    */
    func error()
    
    /**
     Tells the delegate that the user desires to cancel the flow execution
    */
    func cancel()
}

@objc
final class SampleAppOnfidoWrapper: NSObject {
    
    /**
     The object that acts as the delegate of the SampleAppOnfidoWrapper
    */
    @objc weak var delegate: SampleAppOnfidoWrapperDelegate?
    
    private var onfidoFlow: OnfidoFlow? // Remember to keep a strong reference to OnfidoFlow otherwise it will get deallocated and the flow won't work
    private let token = "YOUR_TOKEN_HERE"
    
    @objc func getViewController(_ onLoad: @escaping (UIViewController?) -> Void) {
        
        self.createApplicant { (applicantId, error) in
            
            guard error == nil else {
                self.delegate?.error()
                return
            }
            
            onLoad(self.getOnfidoFlow(forApplicantWithId: applicantId!))
        }
    }
    
    private func getOnfidoFlow(forApplicantWithId applicantId: String) -> UIViewController? {
        
        let responseHandler: (OnfidoResponse) -> Void = { response in
            
            if case OnfidoResponse.error(let aError) = response {
                
                // handle errors
                self.delegate?.error()
                
            } else if case OnfidoResponse.success(let results) = response {
                
                // handle success
                // extract applicant, document and face here
                
                // i.e. Applicant ID extraction
                
                let applicant: Optional<OnfidoResult> = results.filter({ result in
                    if case OnfidoResult.applicant = result { return true }
                    return false
                }).first
                
                if let applicantUnwrapped = applicant,
                    case OnfidoResult.applicant(let applicantResult) = applicantUnwrapped,
                    let applicantId = applicantResult.id {
                    
                    /* applicantResult
                     Onfido api response to the creation of the applicant
                     More details: https://documentation.onfido.com/#create-applicant
                     */
                    
                    // At this point you have all the necessary information to create a check
                    self.delegate?.success(forApplicantWithId: applicantId)
                }
                
            } else if case OnfidoResponse.cancel = response {
                
                // handle user cancel
                
                self.delegate?.cancel()
            }
            
            // after receiving the response, remember to dismiss the view controller from you view controller instance
            // objc [self dismissViewControllerAnimated:YES completion:NULL];
            // swift self.dismiss(animated: true, completion: {})
        }
        
        let config = try! OnfidoConfig.builder()
            .withToken(token) // Replace with your token here
            .withApplicantId(applicantId)
            .withDocumentStep()
            .withFaceStep(ofVariant: .photo)
            .build()
        
        self.onfidoFlow = OnfidoFlow(withConfiguration: config)
            .with(responseHandler: responseHandler)
        
        do {
            
            let onfidoRun = try self.onfidoFlow!.run()
            onfidoRun.modalPresentationStyle = .formSheet // to present modally
            return onfidoRun
            
        } catch let error {
            
            // handle your errors here
            // usually required permission are not available, i.e. such as camera permission which is a must
            
            self.delegate?.error()
            return nil
        }
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
