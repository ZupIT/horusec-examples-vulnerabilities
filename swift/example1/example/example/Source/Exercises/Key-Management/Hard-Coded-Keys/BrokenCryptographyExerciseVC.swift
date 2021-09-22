// Copyright 2021 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit

func pathDocumentDirectory(fileName: String) -> String {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                            .userDomainMask, true)[0]
    return documentsPath + "/\(fileName)"
}

class BrokenCryptographyExerciseVC: UIViewController {
    var encryptionKey = "myencrytionkey"
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func showItemPressed() {
        
         UIAlertController.showAlertWith(title: "BrokenCryptography", message: "Try Harder!")
 
       /* let encryptedFilePath = pathDocumentDirectory(fileName: "encrypted")
        let encryptedFilePathURL = URL(fileURLWithPath: encryptedFilePath)
        guard let encryptedData = try? Data(contentsOf: encryptedFilePathURL)  else {
            return
        }
        
        let encryptionKeyData = encryptionKey.data(using: .utf8)
        let decryptedData = encryptedData.aes(operation: kCCDecrypt, keyData: encryptionKeyData!)
        let decryptedPassword = String(data: decryptedData, encoding: .utf8) ?? ""
        print(decryptedPassword)
        UIAlertController.showAlertWith(title: "BrokenCryptography", message: decryptedPassword) */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let password = "b@nkP@ssword123"
        passwordTextField.text = password
        let data = password.data(using: .utf8)
        print(data!)
        
        let encryptionKeyData = encryptionKey.data(using: .utf8)
        let encryptedData = data?.aes(operation: kCCEncrypt, keyData: encryptionKeyData!)
        let url = URL(fileURLWithPath: pathDocumentDirectory(fileName: "encrypted"))
        try? encryptedData?.write(to: url, options: .atomic)
    }
}
