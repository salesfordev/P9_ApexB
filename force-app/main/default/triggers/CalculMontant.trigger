trigger CalculMontant on Order (before update) {
	
	Order newOrder= trigger.new;
	newOrder.NetAmount__c = newOrder.TotalAmount - newOrder.ShipmentCost__c;
}