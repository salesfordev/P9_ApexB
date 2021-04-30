public with sharing class HandlerUpdateAccount {
    public static void updateAccHandler(List<Order> orders) {
        set<Id> accountId = new set<Id>();
        List<Account> accountToUpdate = new List<Account>();
        for(Integer i=0; i<orders.size(); i++){
            accountId.add(orders[i].AccountId);
        }
        List<Account> accountsWithOrders = [SELECT Id, (SELECT TotalAmount FROM Orders WHERE Status='Odered')
                                            FROM Account
                                            WHERE Id IN :accountId
                                            ];
        for(Account myAccount : accountsWithOrders){
            myAccount.Chiffre_d_affaire__c = 0;
            for(Order order : myAccount.Orders){
                myAccount.Chiffre_d_affaire__c += order.TotalAmount;
            }

            update accountsWithOrders;
        }
    }
}