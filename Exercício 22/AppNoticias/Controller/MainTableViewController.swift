import UIKit
import CoreData

class MainTableViewController: UITableViewController {

    var activityView: UIActivityIndicatorView?
    var fetchedResultController: NSFetchedResultsController<NewsData>!
    var newsData = [NewsData]()
    var dataController: DataController!

    fileprivate func setUpFetchedResultController() {
        let fetchRequest: NSFetchRequest<NewsData> = NewsData.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: "Notícias")

        fetchedResultController.delegate = self

        do {
            try fetchedResultController.performFetch()
        } catch {
            print("No fetchedResultController")
        }
    }

    fileprivate func getNewsData() {
        NetworkManager.shared.getNews { [weak self] result  in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.deleteData()
                for item in response {
                    let newsData = NewsData(context: self.dataController.viewContext)
                    
                    newsData.url = item.url
                    newsData.title = item.title
                    newsData.byline = item.byline
                    
                    if let image = item.media.first?.mediaMetadata.last?.url {
                        guard let imageURL = URL(string: image) else { return }
                        guard let imageData = try? Data(contentsOf: imageURL) else { return }

                        newsData.image = image
                        newsData.data = imageData
                    }
                    try? self.dataController.viewContext.save()
                }
            case .failure(let error):
                print("error: \(error)")
            }
            
            DispatchQueue.main.async {
                self.hideActivityIndicator()
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate func deleteData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NewsData.fetchRequest()
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        deleteRequest.resultType = .resultTypeObjectIDs
        
        do {
            let context = dataController.viewContext
            let result = try context.execute(deleteRequest)
            
            guard let deleteResul = result as? NSBatchDeleteResult,
                  let ids = deleteResul.result as? [NSManagedObjectID] else {
                      return
                  }
            
            let changes = [NSDeletedObjectsKey: ids]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [context])
        } catch {
            print("error: \(error as Any)")
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicatior()
        getNewsData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpFetchedResultController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fetchedResultController = nil
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultController.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aNewsData = fetchedResultController.object(at: indexPath)

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewYorkTableViewCell
       
        cell.title.text = aNewsData.title
        cell.by.text = aNewsData.byline
        if let imageData = aNewsData.data {
            cell.imageNews.image = UIImage(data: imageData)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aNewsData = fetchedResultController.object(at: indexPath)

        guard let url = aNewsData.url else { return }
        
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
    
    func showActivityIndicatior() {
        activityView = UIActivityIndicatorView(style: .large)
        
        guard let activityView = activityView else {
            return
        }

        self.view.addSubview(activityView)
        
        activityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityView.widthAnchor.constraint(equalToConstant: 70),
            activityView.heightAnchor.constraint(equalToConstant: 70),
            activityView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        activityView.startAnimating()
        
    }
    
    func hideActivityIndicator() {
        guard let activityView = activityView else {
            return
        }

        activityView.stopAnimating()
    }
}

extension MainTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if newIndexPath != nil {
                tableView.insertRows(at: [newIndexPath!], with: .none)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .none)
            }
            break
        case .move, .update:
            break
        }
    }
}
