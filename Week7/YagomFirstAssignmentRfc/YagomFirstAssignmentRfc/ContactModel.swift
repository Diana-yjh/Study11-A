struct ContactInfo: Comparable {
    static func < (lhs: ContactInfo, rhs: ContactInfo) -> Bool {
        if lhs.name == rhs.name {
            return lhs.age < rhs.age
        } else if lhs.age == rhs.age {
            return lhs.phone < rhs.phone
        }
        
        return lhs.name < rhs.name
    }
    
    static func == (lhs: ContactInfo, rhs: ContactInfo) -> Bool {
        lhs.name == rhs.name
    }
    
    var name: String
    var age: String
    var phone: String
}
