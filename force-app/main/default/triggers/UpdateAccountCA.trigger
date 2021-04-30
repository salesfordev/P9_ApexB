trigger UpdateAccountCA on Order (after update) {
    List<Order> orders = new List<Order>();
        for(Order order : trigger.new){
            if(order.Status == 'Ordered'){
                
                orders.add(order);
            }
        }
    HandlerUpdateAccount.updateAccHandler(orders);

}