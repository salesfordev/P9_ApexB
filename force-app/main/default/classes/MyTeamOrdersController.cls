public with sharing class MyTeamOrdersController {
    public decimal sumOders{
        get{
			AggregateResult groupedResults = [SELECT SUM(TotalAmount) total FROM Order WHERE Status = 'Ordered'];
			return (decimal)groupedResults.get('total');

        }
        private set;
    }
}
