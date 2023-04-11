class UserplantEntity {
  String? plantationDate;
  String? plantaCategory;
  String? tempOf;
  String? humidity;
  String? co2ppm;
  String? waterVolumne;
  String? imgUrl;
  String? waterTemp;
  String? waterPh;
  String? week;
  UserplantEntity(
      {this.plantaCategory,
      this.plantationDate,
      this.tempOf,
      this.co2ppm,
      this.humidity,
      this.imgUrl,
      this.waterPh,
      this.waterTemp,
      this.waterVolumne,
      this.week});
}
