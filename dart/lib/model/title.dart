class Title {
  String? ptBr;

  Title({this.ptBr});

  Title.fromJson(Map<String, dynamic> json) {
    ptBr = json['pt-br'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pt-br'] = ptBr;
    return data;
  }
}
