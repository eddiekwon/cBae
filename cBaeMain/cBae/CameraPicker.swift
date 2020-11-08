//
//  CameraPicker.swift
//  Dot
//
//  Created by eddie on 16/05/2019.
//  Copyright © 2019 eddie. All rights reserved.
//

import UIKit
import Photos

protocol PhotoPickable: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var pickerController: UIImagePickerController? {get set}
}

extension PhotoPickable where Self: UIViewController{
    func showCamera(){
        self.requestCamera { [weak self] isSuccess in
            guard let self = self else { return }
            guard isSuccess == true else { return }
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.allowsEditing = true
            picker.delegate = self
            self.pickerController = picker
            self.present(picker , animated: true , completion: nil)
        }
    }
    func showPhotos(){
        
    }
}

extension PhotoPickable {
    func requestCamera( doneHandler: @escaping (Bool)->Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (success) in
                DispatchQueue.main.async {
                    doneHandler(success)
                }
            }
        case .restricted:
            doneHandler(false)
        case .denied:
            moveToSystemSetting()
            doneHandler(false)
        case .authorized:
            doneHandler(true)
        @unknown default:
            assertionFailure("for future default broken")
        }
    }
}


extension PhotoPickable{
    func moveToSystemSetting(){
        guard let url = URL(string: UIApplication.openSettingsURLString ) else { return }
        
        WindowPopup.show(title: "카메라 어쩔겨?", message: "어째?") { (done) in
            if done {
                UIApplication.shared.open(url)
                //시스템 세팅으로 이동함.
            }else{
                print("canceled")
            }
        }
    }
}
