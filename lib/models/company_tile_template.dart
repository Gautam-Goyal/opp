class CompanyTile {
  String name;
  int package;
  String department;
  int minPercentage;
  var timestamp;
  List roundsInfo;

  CompanyTile.fromMap(Map m)
      : name = m['Name'].toString(),
        package = m['Package'],
  department=m['Department'].toString(),
  minPercentage=m['Min. Percentage'],
  timestamp=m['Arrival Date'],
  roundsInfo=m['RoundsInfo'];
}