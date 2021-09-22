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

//TODO: Make a generic HTML handler
import UIKit

class HTMLViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var contentString: String? = nil {
        didSet {
            loadWebView(from: contentString ?? "")
        }
    }
    
    var contentHTMLFile: String? = nil {
        didSet {
            let filePath = Bundle.main.path(forResource: contentHTMLFile, ofType: nil) ?? ""
            let fileContents = (try? String(contentsOfFile: filePath, encoding: .utf8)) ?? ""
            loadWebView(from: fileContents)
        }
    }
}

extension HTMLViewController {
    func loadWebView(from content:String) {
        let baseURL = URL(fileURLWithPath: Bundle.main.resourcePath!, isDirectory: true)
        webView.loadHTMLString(content, baseURL: baseURL)
    }
    
    @IBAction func backItemPressed() {
        dismiss(animated: true, completion: nil)
    }
}
