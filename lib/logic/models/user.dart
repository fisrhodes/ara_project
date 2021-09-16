class UserData {
  String tenantId;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  String id;
  String username;
  String displayName;
  String password;
  String newPassword;
  Permission permission;
  String token;
  Profession profession;
  String authenticationType;
  String oauthToken;
  String impersonateUsername;

  UserData(
      {this.tenantId,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.id,
      this.username,
      this.displayName,
      this.password,
      this.newPassword,
      this.permission,
      this.token,
      this.profession,
      this.authenticationType,
      this.oauthToken,
      this.impersonateUsername});

  UserData.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    id = json['id'];
    username = json['username'];
    displayName = json['displayName'];
    password = json['password'];
    newPassword = json['newPassword'];
    permission = json['permission'] != null
        ? new Permission.fromJson(json['permission'])
        : null;
    token = json['token'];
    profession = json['profession'] != null
        ? new Profession.fromJson(json['profession'])
        : null;
    authenticationType = json['authenticationType'];
    oauthToken = json['oauthToken'];
    impersonateUsername = json['impersonateUsername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['id'] = this.id;
    data['username'] = this.username;
    data['displayName'] = this.displayName;
    data['password'] = this.password;
    data['newPassword'] = this.newPassword;
    if (this.permission != null) {
      data['permission'] = this.permission.toJson();
    }
    data['token'] = this.token;
    if (this.profession != null) {
      data['profession'] = this.profession.toJson();
    }
    data['authenticationType'] = this.authenticationType;
    data['oauthToken'] = this.oauthToken;
    data['impersonateUsername'] = this.impersonateUsername;
    return data;
  }
}

class Permission {
  String title;
  String code;

  Permission({this.title, this.code});

  Permission.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['code'] = this.code;
    return data;
  }
}

class Profession {
  String tenantId;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  String id;
  String title;
  Users users;
  bool isActive;

  Profession(
      {this.tenantId,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.id,
      this.title,
      this.users,
      this.isActive});

  Profession.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    id = json['id'];
    title = json['title'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.users != null) {
      data['users'] = this.users.toJson();
    }
    data['isActive'] = this.isActive;
    return data;
  }
}

class Users {
  String testActionAssigneeEmaratechAe;
  String testObjectiveOwnerEmaratechAe;
  String testActionOwnerEmaratechAe;
  String testStrategyOwnerEmaratechAe;
  String testInitiativeOwnerEmaratechAe;
  String testKpiOwnerEmaratechAe;
  String testSubActionAssigneeEmaratechAe;

  Users(
      {this.testActionAssigneeEmaratechAe,
      this.testObjectiveOwnerEmaratechAe,
      this.testActionOwnerEmaratechAe,
      this.testStrategyOwnerEmaratechAe,
      this.testInitiativeOwnerEmaratechAe,
      this.testKpiOwnerEmaratechAe,
      this.testSubActionAssigneeEmaratechAe});

  Users.fromJson(Map<String, dynamic> json) {
    testActionAssigneeEmaratechAe = json['test_action_assignee@emaratech.ae'];
    testObjectiveOwnerEmaratechAe = json['test_objective_owner@emaratech.ae'];
    testActionOwnerEmaratechAe = json['test_action_owner@emaratech.ae'];
    testStrategyOwnerEmaratechAe = json['test_strategy_owner@emaratech.ae'];
    testInitiativeOwnerEmaratechAe = json['test_initiative_owner@emaratech.ae'];
    testKpiOwnerEmaratechAe = json['test_kpi_owner@emaratech.ae'];
    testSubActionAssigneeEmaratechAe =
        json['test_sub_action_assignee@emaratech.ae'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['test_action_assignee@emaratech.ae'] =
        this.testActionAssigneeEmaratechAe;
    data['test_objective_owner@emaratech.ae'] =
        this.testObjectiveOwnerEmaratechAe;
    data['test_action_owner@emaratech.ae'] = this.testActionOwnerEmaratechAe;
    data['test_strategy_owner@emaratech.ae'] =
        this.testStrategyOwnerEmaratechAe;
    data['test_initiative_owner@emaratech.ae'] =
        this.testInitiativeOwnerEmaratechAe;
    data['test_kpi_owner@emaratech.ae'] = this.testKpiOwnerEmaratechAe;
    data['test_sub_action_assignee@emaratech.ae'] =
        this.testSubActionAssigneeEmaratechAe;
    return data;
  }
}

//Email address: test_action_owner@emaratech.ae
//$2b$10$0cKFD3AYtposSIvMnDwlOuO38FE6dqQ8b.aUs5Ug4mqK8Mt1IHOoS
