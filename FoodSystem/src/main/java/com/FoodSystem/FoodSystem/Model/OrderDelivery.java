package com.FoodSystem.FoodSystem.Model;
import jakarta.persistence.*;

@Entity
public class OrderDelivery {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

   

    @ManyToOne
    @JoinColumn(name = "order_data_id")
    private OrderData orderData;



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public OrderData getOrderData() {
		return orderData;
	}



	public void setOrderData(OrderData orderData) {
		this.orderData = orderData;
	}



	public OrderDelivery(Long id, OrderData orderData) {
		super();
		this.id = id;
		this.orderData = orderData;
	}



	public OrderDelivery() {
		super();
		// TODO Auto-generated constructor stub
	}



	@Override
	public String toString() {
		return "OrderDelivery [id=" + id + ", orderData=" + orderData + "]";
	}

    
    
}
