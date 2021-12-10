class Stock {
  final String? symbol;
  final String? name;
  final String? description;
  final String? country;
  final String? sector;
  final String? industry;
  final String? currency;
  final String? bookValue;
  final String? profitMargin;

  Stock(
      {this.symbol,
      this.name,
      this.description,
      this.country,
      this.sector,
      this.industry,
      this.currency,
      this.bookValue,
      this.profitMargin});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['Symbol'],
      name: json['Name'],
      description: json['Description'],
      country: json['Country'],
      sector: json['Sector'],
      industry: json['Industry'],
      currency: json['Currency'],
      bookValue: json['BookValue'],
      profitMargin: json['ProfitMargin'],
    );
  }
}
