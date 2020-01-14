class UserLoginModel {
  String email;
  String mobileNumber;
  String fullName;
  int userId;
  String coverPicture;
  String profilePicture;
  String userAccessToken;

  UserLoginModel.fromJson(obj) {
    this.email = obj['Email'];
    this.mobileNumber = obj['MobileNumber'];
    this.fullName = obj['FullName'];
    this.userId = obj['UserId'];
    this.coverPicture = obj['CoverPicture'];
    this.profilePicture = obj['ProfilePicture'];
    this.userAccessToken = obj['UserAccessToken'];
  }
  Map<String, dynamic> toJson() => {
        'Email': email,
        'MobileNumber': mobileNumber,
        'FullName': fullName,
        'UserId': userId,
        'CoverPicture': coverPicture,
        'ProfilePicture': profilePicture,
        'UserAccessToken': userAccessToken
      };
}
