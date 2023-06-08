//
//  GItHubListViewController.swift
//  storyboardtest
//
//  Created by Kazunori Tsuchiya on 2023/06/08.
//

import UIKit
import Foundation

struct Data: Codable{
    var name: String
}

class GitHubListViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var UserData = "Apple"
    var DataArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        DataArray = searchSyncUser(username: UserData)
    }
    
    func searchSyncUser(username: String)->[String]{
        var resultdata = [Data]()
        var result = [String]()
        let semaphore = DispatchSemaphore(value: 0)
        searchUser(username: username){(data: [Data]) in
            resultdata = data
            semaphore.signal()
        }
        switch semaphore.wait(timeout: .now() + 1){
            case .success: resultdata.forEach { Data in
                    result.append(Data.name)
                }
            case .timedOut:
                result = []
        }
            
        return result
    }
    
    func searchUser(username: String,_ after:@escaping ([Data]) -> ()){
        guard let url = URL(string: "https://api.github.com/users/" + "\(username)" + "/repos") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if error != nil{
                print("error")
            }
            
            if let response = response as? HTTPURLResponse {
                if !(200...299).contains(response.statusCode) {
                    print("Response status code does not indicate success: \(response.statusCode)")
                    return
                }
            }
            
            if let data = data{
                guard let decodedResponse = try? JSONDecoder().decode([Data].self, from: data) else {print("Json decode error")
                        return
                    }
                after(decodedResponse)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath)
                cell.textLabel!.text = DataArray[indexPath.row]
                return cell
    }
    
}
