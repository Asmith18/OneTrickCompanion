//
//  NewEntryTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/25/22.
//

import UIKit

class NewEntryTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var models = [NewEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Line Ups"
        getAllEntry()
        tableView.frame = view.bounds
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Entry", message: "Enter Entry Name", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            self.createEntry(name: text)
        }))
        present(alert, animated: true)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "newEntryCell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = models[indexPath.row]
            deleteEntry(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    //MARK: - Core Data
    
    func getAllEntry() {
        do {
            models = try context.fetch(NewEntry.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            
        }
    }
    
    func createEntry(name: String) {
        let newEntry = NewEntry(context: context)
        newEntry.name = name
        newEntry.date = Date()
        
        do {
            try context.save()
            getAllEntry()
        } catch {
            
        }
    }
    
    func deleteEntry(entry: NewEntry) {
        context.delete(entry)
        
        do {
            try context.save()
            getAllEntry()
        } catch {
            
        }
    }
    
    func updateEntry(entry: NewEntry, newName: String) {
        entry.name = newName
        
        do {
            try context.save()
            getAllEntry()
        } catch {
            
        }
    }
}
