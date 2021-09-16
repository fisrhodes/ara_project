class ApiResponse {
  bool successfull;
  String statusCode;
  Map<String, dynamic> data;
  String errorDescription;

  ApiResponse(
      {this.successfull, this.statusCode, this.data, this.errorDescription});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    successfull = json['successful'];
    statusCode = json['statusCode'];
    data = json['data'];
    errorDescription = json['errorDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['successfull'] = this.successfull;
    data['statusCode'] = this.statusCode;
    data['data'] = this.data;
    data['errorDescription'] = this.errorDescription;
    return data;
  }
}
