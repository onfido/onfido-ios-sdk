//
//  SampleAppOnfidoWrapper.swift
//  SampleAppObjC
//
//  Created by Anurag Ajwani on 22/11/2017.
//  Copyright © 2017 onfido. All rights reserved.
//

import Foundation
import Onfido

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
    
    @objc func getViewController() -> UIViewController? {
        
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
            country: "GBR")
        
        let applicant = Applicant.new(
            firstName: "Theresa",
            lastName: "May",
            email: "pm@number10.gov.uk",
            dateOfBirth: dobDate,
            country: "GBR",
            idNumbers: [],
            addresses: [address])
        
        let config = try! OnfidoConfig.builder()
            .withToken("YOUR_TOKEN_HERE") // Replace with your token here
            .withApplicant(applicant)
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
        }
    }
}
