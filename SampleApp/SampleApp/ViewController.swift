//
//  ViewController.swift
//
//  Copyright © 2016-2025 Onfido. All rights reserved.
//

import Onfido
import UIKit

final class ViewController: UIViewController {
    @IBAction
    func verifyUser(_ sender: Any) {
        // TODO: Call your backend to get `sdkToken` https://https://documentation.onfido.com/sdk/ios/#sdk-authentication
        let sdkToken = ""

        let config = try! OnfidoConfig.builder()
            .withSDKToken(sdkToken)
            .withWelcomeStep()
            .withDocumentStep()
            .withFaceStep(ofVariant: .photo(withConfiguration: nil))
            .build()

        let responseHandler: (OnfidoResponse) -> Void = { [weak self] response in
            if case let OnfidoResponse.error(error) = response {
                self?.showError(error)
            } else if case OnfidoResponse.success = response {
                // SDK flow has been completed successfully. You may want to create a check in your backend at this
                // point. Follow https://documentation.onfido.com/api/latest/#create-check to understand how to create
                // a check
                self?.showAlert(title: "Success", message: "SDK flow has been completed successfully")
            } else if case OnfidoResponse.cancel = response {
                self?.showAlert(title: "Canceled", message: "Canceled by user")
            }
        }

        let onfidoFlow = OnfidoFlow(withConfiguration: config)
            .with(responseHandler: responseHandler)

        do {
            /*
             Supported presentation styles are:
             For iPhones: .fullScreen
             For iPads: .fullScreen and .formSheet
             Due to iOS 13 you must specify .fullScreen as the default is now .pageSheet
             */
            var modalPresentationStyle: UIModalPresentationStyle = .fullScreen

            if UIDevice.current.userInterfaceIdiom == .pad {
                modalPresentationStyle = .formSheet // to present modally on iPads
            }

            try onfidoFlow.run(from: self, presentationStyle: modalPresentationStyle)
        } catch {
            // Cannot execute the flow
            showError(error)
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    private func showError(_ error: Error) {
        showAlert(title: "Error", message: String(describing: error))
    }
}
