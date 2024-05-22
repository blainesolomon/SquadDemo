//// Assume this is running in the context of an actual user facing production application.
//
//import UIKit
//
//class ArticlesViewController: UIViewController, UITableViewDataSource {
//    private var articles: [Article] = []
//    private var tableView: UITableView = UITableView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        fetchData()
//    }
//
//    // Prevent retain cycles with weak self reference
//
//    func fetchData() {
//        APIClient.fetchArticles { [self] result in
//            switch result {
//            case .success(let articles):
//                DispatchQueue.main.async {
//                    self.articles = articles
//                    self.tableView.reloadData()
//                }
//
//                // Add error handling for user facing feedback
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return articles.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        // Extract this cell ID
//        // Add support for dynamic text for text sizing based on user preference
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell {
//           cell.textLabel.text = articles[indexPath.row].title
//        }
//        return cell
//    }
//}
//
//// Feels like this needs more structure, identity,
//struct Article {
//    let title: String
//}
//
//class APIClient {
//    static func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
//        let sampleArticles = [Article(title: "iOS Development"), Article(title: "SwiftUI Essentials")]
//        completion(.success(sampleArticles))
//    }
//}
//
//// Brainstorm migrating to SwiftUI
//
//// Add pull to refresh
//
//// If we stay in UIKit, this UI could be built in a storyboard or nib for visual development
//
//// Extract table view functions; extract API calls
//
