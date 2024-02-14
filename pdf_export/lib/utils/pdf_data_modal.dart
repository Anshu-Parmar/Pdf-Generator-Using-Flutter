class Invoice {
  final String customer;
  final String address;
  final List<LineItem> items;
  final String name;
  Invoice({required this.customer, required this.address,required this.items, required this.name});
  double totalCost() {
    return items.fold(0, (previousValue, element) => previousValue + element.cost);
  }
}

final invoices = [
  Invoice(
      customer: 'David Thomas',
      address: '123 Fake St\r Bermuda Triangle',
      items: [
        LineItem(
          'Technical Engagement',
          120,
        ),
        LineItem('Deployment Assistance', 200),
        LineItem('Develop Software Solution', 3020),
        LineItem('Produce Documentation', 840),
      ],
      name: 'Create and deploy software package'),
  Invoice(
    customer: 'Michael Ambiguous',
    address: '82 Unsure St\r\nBaggle Palace',
    items: [
      LineItem('Professional Advice', 100),
      LineItem('Lunch Bill', 43.55),
      LineItem('Remote Assistance', 50),
    ],
    name: 'Provide remote support after lunch',
  ),
  Invoice(
    customer: 'Marty McDanceFace',
    address: '55 Dancing Parade\r\nDance Place',
    items: [
      LineItem('Program the robots', 400.50),
      LineItem('Find tasteful dance moves for the robots', 80.55),
      LineItem('General quality assurance', 80),
    ],
    name: 'Create software to teach robots how to dance',
  )
];

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}