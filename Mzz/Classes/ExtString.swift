
extension String {
    var length : Int {
        return self.characters.count
    }
    
    /*subscript(integerIndex: Int) -> Character {
     let index = startIndex.advancedBy(integerIndex)
     return self[index]
     }*/
    
    subscript(integerRange: CountableClosedRange<Int>) -> String {
        let range = self.index(self.startIndex, offsetBy: integerRange.lowerBound)...self.index(self.startIndex, offsetBy: integerRange.upperBound)
        return String(self[range])
    }
    
    /*var localized: String {
     return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
     }*/
}
