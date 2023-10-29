enum DashboardType {
  randomImageByBreed('Random Image by Breed'),
  imagesListByBreed('Images List by Breed'),
  randomImageBySubBreed('Random Image by SubBreed'),
  imagesListBySubBreed('Images List by SubBreed');

  final String valueName;
  const DashboardType(this.valueName);

  bool get isMultiple => this == DashboardType.imagesListByBreed || this == DashboardType.imagesListBySubBreed;
  bool get isSingle => this == DashboardType.randomImageByBreed || this == DashboardType.randomImageBySubBreed;

  bool get hasSubBreed => this == DashboardType.randomImageBySubBreed || this == DashboardType.imagesListBySubBreed;
}
