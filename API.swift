//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class CreateXModelTypeMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateXModelType($email: AWSEmail!, $title: String!, $isUpgraded: Int, $tags: String) {\n  createXModelType(email: $email, title: $title, isUpgraded: $isUpgraded, tags: $tags) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var email: String
  public var title: String
  public var isUpgraded: Int?
  public var tags: String?

  public init(email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil) {
    self.email = email
    self.title = title
    self.isUpgraded = isUpgraded
    self.tags = tags
  }

  public var variables: GraphQLMap? {
    return ["email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createXModelType", arguments: ["email": GraphQLVariable("email"), "title": GraphQLVariable("title"), "isUpgraded": GraphQLVariable("isUpgraded"), "tags": GraphQLVariable("tags")], type: .object(CreateXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createXModelType: CreateXModelType? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createXModelType": createXModelType.flatMap { $0.snapshot }])
    }

    public var createXModelType: CreateXModelType? {
      get {
        return (snapshot["createXModelType"] as? Snapshot).flatMap { CreateXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createXModelType")
      }
    }

    public struct CreateXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class UpdateXModelTypeMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateXModelType($id: ID!, $title: String!, $isUpgraded: Int!, $tags: String!) {\n  updateXModelType(id: $id, title: $title, isUpgraded: $isUpgraded, tags: $tags) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var id: GraphQLID
  public var title: String
  public var isUpgraded: Int
  public var tags: String

  public init(id: GraphQLID, title: String, isUpgraded: Int, tags: String) {
    self.id = id
    self.title = title
    self.isUpgraded = isUpgraded
    self.tags = tags
  }

  public var variables: GraphQLMap? {
    return ["id": id, "title": title, "isUpgraded": isUpgraded, "tags": tags]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateXModelType", arguments: ["id": GraphQLVariable("id"), "title": GraphQLVariable("title"), "isUpgraded": GraphQLVariable("isUpgraded"), "tags": GraphQLVariable("tags")], type: .object(UpdateXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateXModelType: UpdateXModelType? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateXModelType": updateXModelType.flatMap { $0.snapshot }])
    }

    public var updateXModelType: UpdateXModelType? {
      get {
        return (snapshot["updateXModelType"] as? Snapshot).flatMap { UpdateXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateXModelType")
      }
    }

    public struct UpdateXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class DeleteXModelTypeMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteXModelType($id: ID!, $email: AWSEmail!) {\n  deleteXModelType(id: $id, email: $email) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var id: GraphQLID
  public var email: String

  public init(id: GraphQLID, email: String) {
    self.id = id
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteXModelType", arguments: ["id": GraphQLVariable("id"), "email": GraphQLVariable("email")], type: .object(DeleteXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteXModelType: DeleteXModelType? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteXModelType": deleteXModelType.flatMap { $0.snapshot }])
    }

    public var deleteXModelType: DeleteXModelType? {
      get {
        return (snapshot["deleteXModelType"] as? Snapshot).flatMap { DeleteXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteXModelType")
      }
    }

    public struct DeleteXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class LikeXModelTypeMutation: GraphQLMutation {
  public static let operationString =
    "mutation LikeXModelType($id: ID!, $email: AWSEmail!) {\n  likeXModelType(id: $id, email: $email) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var id: GraphQLID
  public var email: String

  public init(id: GraphQLID, email: String) {
    self.id = id
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("likeXModelType", arguments: ["id": GraphQLVariable("id"), "email": GraphQLVariable("email")], type: .object(LikeXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(likeXModelType: LikeXModelType? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "likeXModelType": likeXModelType.flatMap { $0.snapshot }])
    }

    public var likeXModelType: LikeXModelType? {
      get {
        return (snapshot["likeXModelType"] as? Snapshot).flatMap { LikeXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "likeXModelType")
      }
    }

    public struct LikeXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class DislikeXModelTypeMutation: GraphQLMutation {
  public static let operationString =
    "mutation DislikeXModelType($id: ID!, $email: AWSEmail!) {\n  dislikeXModelType(id: $id, email: $email) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var id: GraphQLID
  public var email: String

  public init(id: GraphQLID, email: String) {
    self.id = id
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("dislikeXModelType", arguments: ["id": GraphQLVariable("id"), "email": GraphQLVariable("email")], type: .object(DislikeXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(dislikeXModelType: DislikeXModelType? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "dislikeXModelType": dislikeXModelType.flatMap { $0.snapshot }])
    }

    public var dislikeXModelType: DislikeXModelType? {
      get {
        return (snapshot["dislikeXModelType"] as? Snapshot).flatMap { DislikeXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "dislikeXModelType")
      }
    }

    public struct DislikeXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class ReportXModelTypeMutation: GraphQLMutation {
  public static let operationString =
    "mutation ReportXModelType($id: ID!, $email: AWSEmail!) {\n  reportXModelType(id: $id, email: $email) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var id: GraphQLID
  public var email: String

  public init(id: GraphQLID, email: String) {
    self.id = id
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("reportXModelType", arguments: ["id": GraphQLVariable("id"), "email": GraphQLVariable("email")], type: .object(ReportXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(reportXModelType: ReportXModelType? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "reportXModelType": reportXModelType.flatMap { $0.snapshot }])
    }

    public var reportXModelType: ReportXModelType? {
      get {
        return (snapshot["reportXModelType"] as? Snapshot).flatMap { ReportXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "reportXModelType")
      }
    }

    public struct ReportXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class AdminChangeXModelTypeMutation: GraphQLMutation {
  public static let operationString =
    "mutation AdminChangeXModelType($id: ID!, $accept: Boolean) {\n  adminChangeXModelType(id: $id, accept: $accept) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var id: GraphQLID
  public var accept: Bool?

  public init(id: GraphQLID, accept: Bool? = nil) {
    self.id = id
    self.accept = accept
  }

  public var variables: GraphQLMap? {
    return ["id": id, "accept": accept]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("adminChangeXModelType", arguments: ["id": GraphQLVariable("id"), "accept": GraphQLVariable("accept")], type: .object(AdminChangeXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(adminChangeXModelType: AdminChangeXModelType? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "adminChangeXModelType": adminChangeXModelType.flatMap { $0.snapshot }])
    }

    public var adminChangeXModelType: AdminChangeXModelType? {
      get {
        return (snapshot["adminChangeXModelType"] as? Snapshot).flatMap { AdminChangeXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "adminChangeXModelType")
      }
    }

    public struct AdminChangeXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class GetXModelTypeQuery: GraphQLQuery {
  public static let operationString =
    "query GetXModelType($id: ID!) {\n  getXModelType(id: $id) {\n    __typename\n    id\n    email\n    title\n    isUpgraded\n    tags\n    dateCreated\n    dateUpgraded\n    dislikesCount\n    likesCount\n    isReported\n    isSpam\n    reportsCount\n    likers\n    dislikers\n    reporters\n    isLikedByTheUser\n    isDislikedByTheUser\n    isReportedByTheUser\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getXModelType", arguments: ["id": GraphQLVariable("id")], type: .object(GetXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getXModelType: GetXModelType? = nil) {
      self.init(snapshot: ["__typename": "Query", "getXModelType": getXModelType.flatMap { $0.snapshot }])
    }

    public var getXModelType: GetXModelType? {
      get {
        return (snapshot["getXModelType"] as? Snapshot).flatMap { GetXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getXModelType")
      }
    }

    public struct GetXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("isUpgraded", type: .scalar(Int.self)),
        GraphQLField("tags", type: .scalar(String.self)),
        GraphQLField("dateCreated", type: .scalar(String.self)),
        GraphQLField("dateUpgraded", type: .scalar(String.self)),
        GraphQLField("dislikesCount", type: .scalar(Int.self)),
        GraphQLField("likesCount", type: .scalar(Int.self)),
        GraphQLField("isReported", type: .scalar(Int.self)),
        GraphQLField("isSpam", type: .scalar(Int.self)),
        GraphQLField("reportsCount", type: .scalar(Int.self)),
        GraphQLField("likers", type: .list(.scalar(String.self))),
        GraphQLField("dislikers", type: .list(.scalar(String.self))),
        GraphQLField("reporters", type: .list(.scalar(String.self))),
        GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
        GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
        self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var isUpgraded: Int? {
        get {
          return snapshot["isUpgraded"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUpgraded")
        }
      }

      public var tags: String? {
        get {
          return snapshot["tags"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tags")
        }
      }

      public var dateCreated: String? {
        get {
          return snapshot["dateCreated"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateCreated")
        }
      }

      public var dateUpgraded: String? {
        get {
          return snapshot["dateUpgraded"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "dateUpgraded")
        }
      }

      public var dislikesCount: Int? {
        get {
          return snapshot["dislikesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikesCount")
        }
      }

      public var likesCount: Int? {
        get {
          return snapshot["likesCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "likesCount")
        }
      }

      public var isReported: Int? {
        get {
          return snapshot["isReported"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReported")
        }
      }

      public var isSpam: Int? {
        get {
          return snapshot["isSpam"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "isSpam")
        }
      }

      public var reportsCount: Int? {
        get {
          return snapshot["reportsCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "reportsCount")
        }
      }

      public var likers: [String?]? {
        get {
          return snapshot["likers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "likers")
        }
      }

      public var dislikers: [String?]? {
        get {
          return snapshot["dislikers"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "dislikers")
        }
      }

      public var reporters: [String?]? {
        get {
          return snapshot["reporters"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "reporters")
        }
      }

      public var isLikedByTheUser: Bool? {
        get {
          return snapshot["isLikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
        }
      }

      public var isDislikedByTheUser: Bool? {
        get {
          return snapshot["isDislikedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
        }
      }

      public var isReportedByTheUser: Bool? {
        get {
          return snapshot["isReportedByTheUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
        }
      }
    }
  }
}

public final class ListXModelTypesQuery: GraphQLQuery {
  public static let operationString =
    "query ListXModelTypes($id: ID, $dateCreated: String, $isSpam: Int, $email: AWSEmail) {\n  listXModelTypes(id: $id, dateCreated: $dateCreated, isSpam: $isSpam, email: $email) {\n    __typename\n    Items {\n      __typename\n      id\n      email\n      title\n      isUpgraded\n      tags\n      dateCreated\n      dateUpgraded\n      dislikesCount\n      likesCount\n      isReported\n      isSpam\n      reportsCount\n      likers\n      dislikers\n      reporters\n      isLikedByTheUser\n      isDislikedByTheUser\n      isReportedByTheUser\n    }\n    LastEvaluatedKey {\n      __typename\n      id\n      dateCreated\n      isSpam\n    }\n  }\n}"

  public var id: GraphQLID?
  public var dateCreated: String?
  public var isSpam: Int?
  public var email: String?

  public init(id: GraphQLID? = nil, dateCreated: String? = nil, isSpam: Int? = nil, email: String? = nil) {
    self.id = id
    self.dateCreated = dateCreated
    self.isSpam = isSpam
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "dateCreated": dateCreated, "isSpam": isSpam, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listXModelTypes", arguments: ["id": GraphQLVariable("id"), "dateCreated": GraphQLVariable("dateCreated"), "isSpam": GraphQLVariable("isSpam"), "email": GraphQLVariable("email")], type: .object(ListXModelType.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listXModelTypes: ListXModelType? = nil) {
      self.init(snapshot: ["__typename": "Query", "listXModelTypes": listXModelTypes.flatMap { $0.snapshot }])
    }

    public var listXModelTypes: ListXModelType? {
      get {
        return (snapshot["listXModelTypes"] as? Snapshot).flatMap { ListXModelType(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listXModelTypes")
      }
    }

    public struct ListXModelType: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelTypeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Items", type: .list(.object(Item.selections))),
        GraphQLField("LastEvaluatedKey", type: .object(LastEvaluatedKey.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, lastEvaluatedKey: LastEvaluatedKey? = nil) {
        self.init(snapshot: ["__typename": "XModelTypeConnection", "Items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "LastEvaluatedKey": lastEvaluatedKey.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["Items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Items")
        }
      }

      public var lastEvaluatedKey: LastEvaluatedKey? {
        get {
          return (snapshot["LastEvaluatedKey"] as? Snapshot).flatMap { LastEvaluatedKey(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "LastEvaluatedKey")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["XModelType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("isUpgraded", type: .scalar(Int.self)),
          GraphQLField("tags", type: .scalar(String.self)),
          GraphQLField("dateCreated", type: .scalar(String.self)),
          GraphQLField("dateUpgraded", type: .scalar(String.self)),
          GraphQLField("dislikesCount", type: .scalar(Int.self)),
          GraphQLField("likesCount", type: .scalar(Int.self)),
          GraphQLField("isReported", type: .scalar(Int.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
          GraphQLField("reportsCount", type: .scalar(Int.self)),
          GraphQLField("likers", type: .list(.scalar(String.self))),
          GraphQLField("dislikers", type: .list(.scalar(String.self))),
          GraphQLField("reporters", type: .list(.scalar(String.self))),
          GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
          self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var isUpgraded: Int? {
          get {
            return snapshot["isUpgraded"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUpgraded")
          }
        }

        public var tags: String? {
          get {
            return snapshot["tags"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "tags")
          }
        }

        public var dateCreated: String? {
          get {
            return snapshot["dateCreated"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateCreated")
          }
        }

        public var dateUpgraded: String? {
          get {
            return snapshot["dateUpgraded"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateUpgraded")
          }
        }

        public var dislikesCount: Int? {
          get {
            return snapshot["dislikesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikesCount")
          }
        }

        public var likesCount: Int? {
          get {
            return snapshot["likesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "likesCount")
          }
        }

        public var isReported: Int? {
          get {
            return snapshot["isReported"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReported")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }

        public var reportsCount: Int? {
          get {
            return snapshot["reportsCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "reportsCount")
          }
        }

        public var likers: [String?]? {
          get {
            return snapshot["likers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "likers")
          }
        }

        public var dislikers: [String?]? {
          get {
            return snapshot["dislikers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikers")
          }
        }

        public var reporters: [String?]? {
          get {
            return snapshot["reporters"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "reporters")
          }
        }

        public var isLikedByTheUser: Bool? {
          get {
            return snapshot["isLikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
          }
        }

        public var isDislikedByTheUser: Bool? {
          get {
            return snapshot["isDislikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
          }
        }

        public var isReportedByTheUser: Bool? {
          get {
            return snapshot["isReportedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
          }
        }
      }

      public struct LastEvaluatedKey: GraphQLSelectionSet {
        public static let possibleTypes = ["LastEvaluatedKey"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("dateCreated", type: .scalar(String.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String? = nil, dateCreated: String? = nil, isSpam: Int? = nil) {
          self.init(snapshot: ["__typename": "LastEvaluatedKey", "id": id, "dateCreated": dateCreated, "isSpam": isSpam])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return snapshot["id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var dateCreated: String? {
          get {
            return snapshot["dateCreated"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateCreated")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }
      }
    }
  }
}

public final class ListXModelTypesLikesSortedQuery: GraphQLQuery {
  public static let operationString =
    "query ListXModelTypesLikesSorted($id: ID, $likesCount: Int, $isSpam: Int, $email: AWSEmail) {\n  listXModelTypesLikesSorted(id: $id, likesCount: $likesCount, isSpam: $isSpam, email: $email) {\n    __typename\n    Items {\n      __typename\n      id\n      email\n      title\n      isUpgraded\n      tags\n      dateCreated\n      dateUpgraded\n      dislikesCount\n      likesCount\n      isReported\n      isSpam\n      reportsCount\n      likers\n      dislikers\n      reporters\n      isLikedByTheUser\n      isDislikedByTheUser\n      isReportedByTheUser\n    }\n    LastEvaluatedKey {\n      __typename\n      id\n      likesCount\n      isSpam\n    }\n  }\n}"

  public var id: GraphQLID?
  public var likesCount: Int?
  public var isSpam: Int?
  public var email: String?

  public init(id: GraphQLID? = nil, likesCount: Int? = nil, isSpam: Int? = nil, email: String? = nil) {
    self.id = id
    self.likesCount = likesCount
    self.isSpam = isSpam
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "likesCount": likesCount, "isSpam": isSpam, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listXModelTypesLikesSorted", arguments: ["id": GraphQLVariable("id"), "likesCount": GraphQLVariable("likesCount"), "isSpam": GraphQLVariable("isSpam"), "email": GraphQLVariable("email")], type: .object(ListXModelTypesLikesSorted.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listXModelTypesLikesSorted: ListXModelTypesLikesSorted? = nil) {
      self.init(snapshot: ["__typename": "Query", "listXModelTypesLikesSorted": listXModelTypesLikesSorted.flatMap { $0.snapshot }])
    }

    public var listXModelTypesLikesSorted: ListXModelTypesLikesSorted? {
      get {
        return (snapshot["listXModelTypesLikesSorted"] as? Snapshot).flatMap { ListXModelTypesLikesSorted(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listXModelTypesLikesSorted")
      }
    }

    public struct ListXModelTypesLikesSorted: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelTypeConnectionLikesSorted"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Items", type: .list(.object(Item.selections))),
        GraphQLField("LastEvaluatedKey", type: .object(LastEvaluatedKey.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, lastEvaluatedKey: LastEvaluatedKey? = nil) {
        self.init(snapshot: ["__typename": "XModelTypeConnectionLikesSorted", "Items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "LastEvaluatedKey": lastEvaluatedKey.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["Items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Items")
        }
      }

      public var lastEvaluatedKey: LastEvaluatedKey? {
        get {
          return (snapshot["LastEvaluatedKey"] as? Snapshot).flatMap { LastEvaluatedKey(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "LastEvaluatedKey")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["XModelType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("isUpgraded", type: .scalar(Int.self)),
          GraphQLField("tags", type: .scalar(String.self)),
          GraphQLField("dateCreated", type: .scalar(String.self)),
          GraphQLField("dateUpgraded", type: .scalar(String.self)),
          GraphQLField("dislikesCount", type: .scalar(Int.self)),
          GraphQLField("likesCount", type: .scalar(Int.self)),
          GraphQLField("isReported", type: .scalar(Int.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
          GraphQLField("reportsCount", type: .scalar(Int.self)),
          GraphQLField("likers", type: .list(.scalar(String.self))),
          GraphQLField("dislikers", type: .list(.scalar(String.self))),
          GraphQLField("reporters", type: .list(.scalar(String.self))),
          GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
          self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var isUpgraded: Int? {
          get {
            return snapshot["isUpgraded"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUpgraded")
          }
        }

        public var tags: String? {
          get {
            return snapshot["tags"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "tags")
          }
        }

        public var dateCreated: String? {
          get {
            return snapshot["dateCreated"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateCreated")
          }
        }

        public var dateUpgraded: String? {
          get {
            return snapshot["dateUpgraded"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateUpgraded")
          }
        }

        public var dislikesCount: Int? {
          get {
            return snapshot["dislikesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikesCount")
          }
        }

        public var likesCount: Int? {
          get {
            return snapshot["likesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "likesCount")
          }
        }

        public var isReported: Int? {
          get {
            return snapshot["isReported"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReported")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }

        public var reportsCount: Int? {
          get {
            return snapshot["reportsCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "reportsCount")
          }
        }

        public var likers: [String?]? {
          get {
            return snapshot["likers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "likers")
          }
        }

        public var dislikers: [String?]? {
          get {
            return snapshot["dislikers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikers")
          }
        }

        public var reporters: [String?]? {
          get {
            return snapshot["reporters"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "reporters")
          }
        }

        public var isLikedByTheUser: Bool? {
          get {
            return snapshot["isLikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
          }
        }

        public var isDislikedByTheUser: Bool? {
          get {
            return snapshot["isDislikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
          }
        }

        public var isReportedByTheUser: Bool? {
          get {
            return snapshot["isReportedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
          }
        }
      }

      public struct LastEvaluatedKey: GraphQLSelectionSet {
        public static let possibleTypes = ["LastEvaluatedKeyLikesSorted"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("likesCount", type: .scalar(Int.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String? = nil, likesCount: Int? = nil, isSpam: Int? = nil) {
          self.init(snapshot: ["__typename": "LastEvaluatedKeyLikesSorted", "id": id, "likesCount": likesCount, "isSpam": isSpam])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return snapshot["id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var likesCount: Int? {
          get {
            return snapshot["likesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "likesCount")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }
      }
    }
  }
}

public final class ListXModelTypesDislikesSortedQuery: GraphQLQuery {
  public static let operationString =
    "query ListXModelTypesDislikesSorted($id: ID, $dislikesCount: Int, $isSpam: Int, $email: AWSEmail) {\n  listXModelTypesDislikesSorted(id: $id, dislikesCount: $dislikesCount, isSpam: $isSpam, email: $email) {\n    __typename\n    Items {\n      __typename\n      id\n      email\n      title\n      isUpgraded\n      tags\n      dateCreated\n      dateUpgraded\n      dislikesCount\n      likesCount\n      isReported\n      isSpam\n      reportsCount\n      likers\n      dislikers\n      reporters\n      isLikedByTheUser\n      isDislikedByTheUser\n      isReportedByTheUser\n    }\n    LastEvaluatedKey {\n      __typename\n      id\n      dislikesCount\n      isSpam\n    }\n  }\n}"

  public var id: GraphQLID?
  public var dislikesCount: Int?
  public var isSpam: Int?
  public var email: String?

  public init(id: GraphQLID? = nil, dislikesCount: Int? = nil, isSpam: Int? = nil, email: String? = nil) {
    self.id = id
    self.dislikesCount = dislikesCount
    self.isSpam = isSpam
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "dislikesCount": dislikesCount, "isSpam": isSpam, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listXModelTypesDislikesSorted", arguments: ["id": GraphQLVariable("id"), "dislikesCount": GraphQLVariable("dislikesCount"), "isSpam": GraphQLVariable("isSpam"), "email": GraphQLVariable("email")], type: .object(ListXModelTypesDislikesSorted.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listXModelTypesDislikesSorted: ListXModelTypesDislikesSorted? = nil) {
      self.init(snapshot: ["__typename": "Query", "listXModelTypesDislikesSorted": listXModelTypesDislikesSorted.flatMap { $0.snapshot }])
    }

    public var listXModelTypesDislikesSorted: ListXModelTypesDislikesSorted? {
      get {
        return (snapshot["listXModelTypesDislikesSorted"] as? Snapshot).flatMap { ListXModelTypesDislikesSorted(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listXModelTypesDislikesSorted")
      }
    }

    public struct ListXModelTypesDislikesSorted: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelTypeConnectionDislikesSorted"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Items", type: .list(.object(Item.selections))),
        GraphQLField("LastEvaluatedKey", type: .object(LastEvaluatedKey.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, lastEvaluatedKey: LastEvaluatedKey? = nil) {
        self.init(snapshot: ["__typename": "XModelTypeConnectionDislikesSorted", "Items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "LastEvaluatedKey": lastEvaluatedKey.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["Items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Items")
        }
      }

      public var lastEvaluatedKey: LastEvaluatedKey? {
        get {
          return (snapshot["LastEvaluatedKey"] as? Snapshot).flatMap { LastEvaluatedKey(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "LastEvaluatedKey")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["XModelType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("isUpgraded", type: .scalar(Int.self)),
          GraphQLField("tags", type: .scalar(String.self)),
          GraphQLField("dateCreated", type: .scalar(String.self)),
          GraphQLField("dateUpgraded", type: .scalar(String.self)),
          GraphQLField("dislikesCount", type: .scalar(Int.self)),
          GraphQLField("likesCount", type: .scalar(Int.self)),
          GraphQLField("isReported", type: .scalar(Int.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
          GraphQLField("reportsCount", type: .scalar(Int.self)),
          GraphQLField("likers", type: .list(.scalar(String.self))),
          GraphQLField("dislikers", type: .list(.scalar(String.self))),
          GraphQLField("reporters", type: .list(.scalar(String.self))),
          GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
          self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var isUpgraded: Int? {
          get {
            return snapshot["isUpgraded"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUpgraded")
          }
        }

        public var tags: String? {
          get {
            return snapshot["tags"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "tags")
          }
        }

        public var dateCreated: String? {
          get {
            return snapshot["dateCreated"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateCreated")
          }
        }

        public var dateUpgraded: String? {
          get {
            return snapshot["dateUpgraded"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateUpgraded")
          }
        }

        public var dislikesCount: Int? {
          get {
            return snapshot["dislikesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikesCount")
          }
        }

        public var likesCount: Int? {
          get {
            return snapshot["likesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "likesCount")
          }
        }

        public var isReported: Int? {
          get {
            return snapshot["isReported"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReported")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }

        public var reportsCount: Int? {
          get {
            return snapshot["reportsCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "reportsCount")
          }
        }

        public var likers: [String?]? {
          get {
            return snapshot["likers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "likers")
          }
        }

        public var dislikers: [String?]? {
          get {
            return snapshot["dislikers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikers")
          }
        }

        public var reporters: [String?]? {
          get {
            return snapshot["reporters"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "reporters")
          }
        }

        public var isLikedByTheUser: Bool? {
          get {
            return snapshot["isLikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
          }
        }

        public var isDislikedByTheUser: Bool? {
          get {
            return snapshot["isDislikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
          }
        }

        public var isReportedByTheUser: Bool? {
          get {
            return snapshot["isReportedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
          }
        }
      }

      public struct LastEvaluatedKey: GraphQLSelectionSet {
        public static let possibleTypes = ["LastEvaluatedKeyDisikesSorted"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("dislikesCount", type: .scalar(Int.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String? = nil, dislikesCount: Int? = nil, isSpam: Int? = nil) {
          self.init(snapshot: ["__typename": "LastEvaluatedKeyDisikesSorted", "id": id, "dislikesCount": dislikesCount, "isSpam": isSpam])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return snapshot["id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var dislikesCount: Int? {
          get {
            return snapshot["dislikesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikesCount")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }
      }
    }
  }
}

public final class ListXModelTypesSearchTagsQuery: GraphQLQuery {
  public static let operationString =
    "query ListXModelTypesSearchTags($id: ID, $tags: String, $email: AWSEmail) {\n  listXModelTypesSearchTags(id: $id, tags: $tags, email: $email) {\n    __typename\n    Items {\n      __typename\n      id\n      email\n      title\n      isUpgraded\n      tags\n      dateCreated\n      dateUpgraded\n      dislikesCount\n      likesCount\n      isReported\n      isSpam\n      reportsCount\n      likers\n      dislikers\n      reporters\n      isLikedByTheUser\n      isDislikedByTheUser\n      isReportedByTheUser\n    }\n    LastEvaluatedKey {\n      __typename\n      id\n    }\n  }\n}"

  public var id: GraphQLID?
  public var tags: String?
  public var email: String?

  public init(id: GraphQLID? = nil, tags: String? = nil, email: String? = nil) {
    self.id = id
    self.tags = tags
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["id": id, "tags": tags, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listXModelTypesSearchTags", arguments: ["id": GraphQLVariable("id"), "tags": GraphQLVariable("tags"), "email": GraphQLVariable("email")], type: .object(ListXModelTypesSearchTag.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listXModelTypesSearchTags: ListXModelTypesSearchTag? = nil) {
      self.init(snapshot: ["__typename": "Query", "listXModelTypesSearchTags": listXModelTypesSearchTags.flatMap { $0.snapshot }])
    }

    public var listXModelTypesSearchTags: ListXModelTypesSearchTag? {
      get {
        return (snapshot["listXModelTypesSearchTags"] as? Snapshot).flatMap { ListXModelTypesSearchTag(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listXModelTypesSearchTags")
      }
    }

    public struct ListXModelTypesSearchTag: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelTypeConnectionScanTags"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Items", type: .list(.object(Item.selections))),
        GraphQLField("LastEvaluatedKey", type: .object(LastEvaluatedKey.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, lastEvaluatedKey: LastEvaluatedKey? = nil) {
        self.init(snapshot: ["__typename": "XModelTypeConnectionScanTags", "Items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "LastEvaluatedKey": lastEvaluatedKey.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["Items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Items")
        }
      }

      public var lastEvaluatedKey: LastEvaluatedKey? {
        get {
          return (snapshot["LastEvaluatedKey"] as? Snapshot).flatMap { LastEvaluatedKey(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "LastEvaluatedKey")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["XModelType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("isUpgraded", type: .scalar(Int.self)),
          GraphQLField("tags", type: .scalar(String.self)),
          GraphQLField("dateCreated", type: .scalar(String.self)),
          GraphQLField("dateUpgraded", type: .scalar(String.self)),
          GraphQLField("dislikesCount", type: .scalar(Int.self)),
          GraphQLField("likesCount", type: .scalar(Int.self)),
          GraphQLField("isReported", type: .scalar(Int.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
          GraphQLField("reportsCount", type: .scalar(Int.self)),
          GraphQLField("likers", type: .list(.scalar(String.self))),
          GraphQLField("dislikers", type: .list(.scalar(String.self))),
          GraphQLField("reporters", type: .list(.scalar(String.self))),
          GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
          self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var isUpgraded: Int? {
          get {
            return snapshot["isUpgraded"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUpgraded")
          }
        }

        public var tags: String? {
          get {
            return snapshot["tags"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "tags")
          }
        }

        public var dateCreated: String? {
          get {
            return snapshot["dateCreated"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateCreated")
          }
        }

        public var dateUpgraded: String? {
          get {
            return snapshot["dateUpgraded"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateUpgraded")
          }
        }

        public var dislikesCount: Int? {
          get {
            return snapshot["dislikesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikesCount")
          }
        }

        public var likesCount: Int? {
          get {
            return snapshot["likesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "likesCount")
          }
        }

        public var isReported: Int? {
          get {
            return snapshot["isReported"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReported")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }

        public var reportsCount: Int? {
          get {
            return snapshot["reportsCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "reportsCount")
          }
        }

        public var likers: [String?]? {
          get {
            return snapshot["likers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "likers")
          }
        }

        public var dislikers: [String?]? {
          get {
            return snapshot["dislikers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikers")
          }
        }

        public var reporters: [String?]? {
          get {
            return snapshot["reporters"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "reporters")
          }
        }

        public var isLikedByTheUser: Bool? {
          get {
            return snapshot["isLikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
          }
        }

        public var isDislikedByTheUser: Bool? {
          get {
            return snapshot["isDislikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
          }
        }

        public var isReportedByTheUser: Bool? {
          get {
            return snapshot["isReportedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
          }
        }
      }

      public struct LastEvaluatedKey: GraphQLSelectionSet {
        public static let possibleTypes = ["LastEvaluatedKeyScanTags"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String? = nil) {
          self.init(snapshot: ["__typename": "LastEvaluatedKeyScanTags", "id": id])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return snapshot["id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class ListXModelTypesUserItemsQuery: GraphQLQuery {
  public static let operationString =
    "query ListXModelTypesUserItems($id: ID, $email: AWSEmail, $dateCreated: String) {\n  listXModelTypesUserItems(id: $id, email: $email, dateCreated: $dateCreated) {\n    __typename\n    Items {\n      __typename\n      id\n      email\n      title\n      isUpgraded\n      tags\n      dateCreated\n      dateUpgraded\n      dislikesCount\n      likesCount\n      isReported\n      isSpam\n      reportsCount\n      likers\n      dislikers\n      reporters\n      isLikedByTheUser\n      isDislikedByTheUser\n      isReportedByTheUser\n    }\n    LastEvaluatedKey {\n      __typename\n      id\n      email\n      dateCreated\n    }\n  }\n}"

  public var id: GraphQLID?
  public var email: String?
  public var dateCreated: String?

  public init(id: GraphQLID? = nil, email: String? = nil, dateCreated: String? = nil) {
    self.id = id
    self.email = email
    self.dateCreated = dateCreated
  }

  public var variables: GraphQLMap? {
    return ["id": id, "email": email, "dateCreated": dateCreated]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listXModelTypesUserItems", arguments: ["id": GraphQLVariable("id"), "email": GraphQLVariable("email"), "dateCreated": GraphQLVariable("dateCreated")], type: .object(ListXModelTypesUserItem.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listXModelTypesUserItems: ListXModelTypesUserItem? = nil) {
      self.init(snapshot: ["__typename": "Query", "listXModelTypesUserItems": listXModelTypesUserItems.flatMap { $0.snapshot }])
    }

    public var listXModelTypesUserItems: ListXModelTypesUserItem? {
      get {
        return (snapshot["listXModelTypesUserItems"] as? Snapshot).flatMap { ListXModelTypesUserItem(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listXModelTypesUserItems")
      }
    }

    public struct ListXModelTypesUserItem: GraphQLSelectionSet {
      public static let possibleTypes = ["XModelTypeConnectionUserItems"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("Items", type: .list(.object(Item.selections))),
        GraphQLField("LastEvaluatedKey", type: .object(LastEvaluatedKey.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, lastEvaluatedKey: LastEvaluatedKey? = nil) {
        self.init(snapshot: ["__typename": "XModelTypeConnectionUserItems", "Items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "LastEvaluatedKey": lastEvaluatedKey.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["Items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "Items")
        }
      }

      public var lastEvaluatedKey: LastEvaluatedKey? {
        get {
          return (snapshot["LastEvaluatedKey"] as? Snapshot).flatMap { LastEvaluatedKey(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "LastEvaluatedKey")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["XModelType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("isUpgraded", type: .scalar(Int.self)),
          GraphQLField("tags", type: .scalar(String.self)),
          GraphQLField("dateCreated", type: .scalar(String.self)),
          GraphQLField("dateUpgraded", type: .scalar(String.self)),
          GraphQLField("dislikesCount", type: .scalar(Int.self)),
          GraphQLField("likesCount", type: .scalar(Int.self)),
          GraphQLField("isReported", type: .scalar(Int.self)),
          GraphQLField("isSpam", type: .scalar(Int.self)),
          GraphQLField("reportsCount", type: .scalar(Int.self)),
          GraphQLField("likers", type: .list(.scalar(String.self))),
          GraphQLField("dislikers", type: .list(.scalar(String.self))),
          GraphQLField("reporters", type: .list(.scalar(String.self))),
          GraphQLField("isLikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isDislikedByTheUser", type: .scalar(Bool.self)),
          GraphQLField("isReportedByTheUser", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, email: String, title: String, isUpgraded: Int? = nil, tags: String? = nil, dateCreated: String? = nil, dateUpgraded: String? = nil, dislikesCount: Int? = nil, likesCount: Int? = nil, isReported: Int? = nil, isSpam: Int? = nil, reportsCount: Int? = nil, likers: [String?]? = nil, dislikers: [String?]? = nil, reporters: [String?]? = nil, isLikedByTheUser: Bool? = nil, isDislikedByTheUser: Bool? = nil, isReportedByTheUser: Bool? = nil) {
          self.init(snapshot: ["__typename": "XModelType", "id": id, "email": email, "title": title, "isUpgraded": isUpgraded, "tags": tags, "dateCreated": dateCreated, "dateUpgraded": dateUpgraded, "dislikesCount": dislikesCount, "likesCount": likesCount, "isReported": isReported, "isSpam": isSpam, "reportsCount": reportsCount, "likers": likers, "dislikers": dislikers, "reporters": reporters, "isLikedByTheUser": isLikedByTheUser, "isDislikedByTheUser": isDislikedByTheUser, "isReportedByTheUser": isReportedByTheUser])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return snapshot["email"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var isUpgraded: Int? {
          get {
            return snapshot["isUpgraded"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUpgraded")
          }
        }

        public var tags: String? {
          get {
            return snapshot["tags"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "tags")
          }
        }

        public var dateCreated: String? {
          get {
            return snapshot["dateCreated"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateCreated")
          }
        }

        public var dateUpgraded: String? {
          get {
            return snapshot["dateUpgraded"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateUpgraded")
          }
        }

        public var dislikesCount: Int? {
          get {
            return snapshot["dislikesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikesCount")
          }
        }

        public var likesCount: Int? {
          get {
            return snapshot["likesCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "likesCount")
          }
        }

        public var isReported: Int? {
          get {
            return snapshot["isReported"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReported")
          }
        }

        public var isSpam: Int? {
          get {
            return snapshot["isSpam"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "isSpam")
          }
        }

        public var reportsCount: Int? {
          get {
            return snapshot["reportsCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "reportsCount")
          }
        }

        public var likers: [String?]? {
          get {
            return snapshot["likers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "likers")
          }
        }

        public var dislikers: [String?]? {
          get {
            return snapshot["dislikers"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "dislikers")
          }
        }

        public var reporters: [String?]? {
          get {
            return snapshot["reporters"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "reporters")
          }
        }

        public var isLikedByTheUser: Bool? {
          get {
            return snapshot["isLikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isLikedByTheUser")
          }
        }

        public var isDislikedByTheUser: Bool? {
          get {
            return snapshot["isDislikedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isDislikedByTheUser")
          }
        }

        public var isReportedByTheUser: Bool? {
          get {
            return snapshot["isReportedByTheUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isReportedByTheUser")
          }
        }
      }

      public struct LastEvaluatedKey: GraphQLSelectionSet {
        public static let possibleTypes = ["LastEvaluatedKeyUserItems"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("dateCreated", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String? = nil, email: String? = nil, dateCreated: String? = nil) {
          self.init(snapshot: ["__typename": "LastEvaluatedKeyUserItems", "id": id, "email": email, "dateCreated": dateCreated])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return snapshot["id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String? {
          get {
            return snapshot["email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var dateCreated: String? {
          get {
            return snapshot["dateCreated"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "dateCreated")
          }
        }
      }
    }
  }
}