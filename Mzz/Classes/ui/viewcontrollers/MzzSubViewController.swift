
import UIKit

open class MzzSubViewController : UIViewController {
    
}

open class MzzListItemView<M> : UITableViewCell {
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func show(_ model: M) { fatalError() }
}
open class MzzListSubViewController<M, V:MzzListItemView<M>> : UITableViewController {
    
    //public var listener:ScoreListViewControllerListener?
    //var onSelectScore:((String)->())?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.isEditing = true
        //tableView.reorder.delegate = self
        
        
        view.backgroundColor = .clear
        tableView.separatorColor = UIColor.white.withAlphaComponent(0.1)
        
        //mCollectionView.register(MeasureView.self, forCellWithReuseIdentifier: "Cell")
        self.tableView.register(V.self, forCellReuseIdentifier: "Cell")
    }
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
    }
    
    private var mList:[M] = []
    func show(_ list:[M]) {
        mList = list
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    /*public func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let from = sourceIndexPath.row
        let to = destinationIndexPath.row
        (parent as! ScoreStorageViewController).listener?.onScoreStorageViewReorder(from: from, to: to)
    }*/
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mList.count
    }
    
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*if let spacer = tableView.reorder.spacerCell(for: indexPath) {
            spacer.layer.shadowColor = UIColor.white.cgColor
            return spacer
        }*/
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! V
        let model = mList[indexPath.row]
        cell.show(model)
        
        // Configure the cell...
        /*cell.handler = {
            self.listener?.onSelectScore(title: model.title)
            self.dismiss(animated: false, completion: nil)
        }*/
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let model = mList[indexPath.row]
            mList.remove(at: indexPath.row)
            //listener?.onDeleteScore(title: model.title)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override open func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override open func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
}


