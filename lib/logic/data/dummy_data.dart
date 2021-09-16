class HomeCardData {
  final String title;
  final String owner;
  final String excution;
  final bool hasWarnning;

  HomeCardData({
    this.title,
    this.owner,
    this.excution,
    this.hasWarnning,
  });
}

List<HomeCardData> financialPerspective = [
  HomeCardData(
    title: 'Diversify Portfolio',
    owner: 'Owner: ARA Administrator',
    excution: 'Execution: 12%  |  Weight: 43%  |  Performance: 10%',
    hasWarnning: true,
  ),
  HomeCardData(
    title: 'Manage Cost',
    owner: 'Owner: ARA Administrator',
    excution: 'Execution: 12%  |  Weight: 43%  |  Performance: 10%',
    hasWarnning: false,
  ),
  HomeCardData(
    title: 'Increase Revenue',
    owner: 'Owner: ARA Administrator',
    excution: 'Execution: 17%  |  Weight: 16%  |  Performance: N/A',
    hasWarnning: false,
  ),
  HomeCardData(
    title: 'Test 1',
    owner: 'Owner: ARA Administrator',
    excution: 'Execution: 12%  |  Weight: 43%  |  Performance: 10%',
    hasWarnning: false,
  ),
  HomeCardData(
    title: 'Test 1',
    owner: 'Owner: ARA Administrator',
    excution: 'Execution: 12%  |  Weight: 43%  |  Performance: 10%',
    hasWarnning: true,
  ),
  HomeCardData(
    title: 'Test 1',
    owner: 'Owner: ARA Administrator',
    excution: 'Execution: 12%  |  Weight: 43%  |  Performance: 10%',
    hasWarnning: false,
  ),
];
