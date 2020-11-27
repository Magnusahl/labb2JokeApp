//
//  ViewController.swift
//  getJoke
//
//  Created by Magnus Ahlqvist on 2020-11-27.
//

import UIKit

class ViewController: UIViewController {

let urlStockholm = "https://official-joke-api.appspot.com/random_joke"

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
}


    @IBAction func getJoke(_ sender: Any) {
        getFunction()
    }
    



func getFunction(){
let request = NSMutableURLRequest(url: NSURL(string: urlStockholm)! as URL)
let session = URLSession.shared
request.httpMethod = "GET"
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.addValue("application/json", forHTTPHeaderField: "Accept")
let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
    
    
    
    let JSON = """
    {
      "id": last joke id + 1,
      "type": "programming",
      "setup": "What's the best thing about a Boolean?",
      "punchline": "Even if you're wrong, you're only off by a bit."
    }
    """

    let jsonData = JSON.data(using: .utf8)!
    let joke: Joke = try! JSONDecoder().decode(Joke.self, from: jsonData)

    print(joke.punchline)

if error != nil {
print("Error: (String(describing: error))")
} else {
print("Response: (String(describing: response))")
}
})

task.resume()

}
}

struct Joke: Decodable {
let punchline: String
}
