//
//  ViewController.swift
//  Project 38 - GitHub Commits
//
//  Created by Joshua on 3/25/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    var container: NSPersistentContainer!
    
    var commits = [Commit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Loading the view controller...")
                
        container = NSPersistentContainer(name: "project38")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        
        performSelector(inBackground: #selector(fetchCommits), with: nil)
        loadSavedData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Commits: \(commits.count)")
        return commits.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Commit", for: indexPath)
        
        let commit = commits[indexPath.row]
        cell.textLabel!.text = commit.message
        cell.detailTextLabel!.text = commit.date.description
        
        return cell
    }
    
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    
    
    @objc func fetchCommits() {
        let githubUrl = "https://api.github.com/repos/apple/swift/commits?per_page=100"
        if let data = try? String(contentsOf: URL(string: githubUrl)!) {
            // Have SwiftyJSON parse the commits.
            let jsonCommits = JSON(parseJSON: data)
            // Get the commits from SwiftJSON.
            let jsonCommitArray = jsonCommits.arrayValue
            
            print("Recieved \(jsonCommitArray.count) new commits.")
            
            DispatchQueue.main.async { [unowned self] in
                for jsonCommit in jsonCommitArray {
                    let commit = Commit(context: self.container.viewContext)
                    self.configure(commit: commit, usingJSON: jsonCommit)
                }
                self.saveContext()
                self.loadSavedData()
            }
        }
    }
    
    
    func configure(commit: Commit, usingJSON json: JSON) {
        commit.sha = json["sha"].stringValue
        commit.message = json["commit"]["message"].stringValue
        commit.url = json["html_url"].stringValue
        
        let formatter = ISO8601DateFormatter()
        commit.date = formatter.date(from: json["commit"]["committer"]["date"].stringValue) ?? Date()
    }
    
    
    func loadSavedData() {
        // Make the request object.
        let request = Commit.createFetchRequest()
        
        // Add in a sorter.
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        
        // Make the request from the container.
        do {
            commits = try container.viewContext.fetch(request)
            print("Got \(commits.count) commits.")
            tableView.reloadData()
        } catch {
            print("Fetch failed.")
        }
    }

}

