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

class HintVC: UIViewController {
    var exercise: Exercise? {
        didSet {
            guard let excercise = exercise else {
                return
            }
            loadPages(with: excercise)
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hints"
    }

    func loadPages(with exercise: Exercise) {
        guard let hints = exercise.hints else { return }
        for i in 0..<hints.count {
            let hintText = hints[i]
            let htmlText = formatAsHTMLFor(text: hintText, index: i)
            let webView = configureWebviewWith(htmlText: htmlText)
            let x = CGFloat(i) * view.frame.size.width
            webView.frame = CGRect(x: x, y: 0,
                                   width: view.frame.size.width, height: view.frame.size.height)
            
            scrollView.addSubview(webView)
        }
        let contentWidth = CGFloat(hints.count) * view.frame.size.width
        scrollView.contentSize = CGSize(width: contentWidth, height: 0)
    }
    
    func formatAsHTMLFor(text: String, index: Int) -> String {
        if text.hasPrefix("<html>") {
            return text
        } else {
            let htmlString =
            """
            <link href="igoat.css" rel="stylesheet" type="text/css">
            <head><body><h2>\(exercise?.name ?? "") (\(index + 1)/\(exercise?.hints?.count ?? 0))</h2>\(text)</body></html>
            """
            return htmlString
        }
    }
    
    func configureWebviewWith(htmlText: String) -> UIWebView {
        let webView = UIWebView()
        let baseURL = URL(fileURLWithPath: Bundle.main.resourcePath!, isDirectory: true)
        webView.loadHTMLString(htmlText, baseURL: baseURL)
        return webView
    }
}
