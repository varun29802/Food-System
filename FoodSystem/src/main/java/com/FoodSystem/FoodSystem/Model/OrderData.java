package com.FoodSystem.FoodSystem.Model;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class OrderData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private double finalPrice;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String name;
    
    @Column(nullable = false)
    private String shippingaddress;
    @Column(nullable = false, columnDefinition = "VARCHAR(255) DEFAULT 'ORDERED'")
    private String orderStatus;
    
    @OneToMany(mappedBy = "orderData", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<OrderDelivery> orderDeliveries;
    
    @ElementCollection
    private List<Integer> productIds;

    @ElementCollection
    private List<String> productName;

    @ElementCollection
    private List<Integer> quantity;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public double getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(double finalPrice) {
		this.finalPrice = finalPrice;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShippingaddress() {
		return shippingaddress;
	}

	public void setShippingaddress(String shippingaddress) {
		this.shippingaddress = shippingaddress;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public List<OrderDelivery> getOrderDeliveries() {
		return orderDeliveries;
	}

	public void setOrderDeliveries(List<OrderDelivery> orderDeliveries) {
		this.orderDeliveries = orderDeliveries;
	}

	public List<Integer> getProductIds() {
		return productIds;
	}

	public void setProductIds(List<Integer> productIds) {
		this.productIds = productIds;
	}

	public List<String> getProductName() {
		return productName;
	}

	public void setProductName(List<String> productName) {
		this.productName = productName;
	}

	public List<Integer> getQuantity() {
		return quantity;
	}

	public void setQuantity(List<Integer> quantity) {
		this.quantity = quantity;
	}

	public OrderData(Long id, double finalPrice, String email, String name, String shippingaddress, String orderStatus,
            List<OrderDelivery> orderDeliveries, List<Integer> productIds, List<String> productName,
            List<Integer> quantity) {
        this.id = id;
        this.finalPrice = finalPrice;
        this.email = email;
        this.name = name;
        this.shippingaddress = shippingaddress;
        this.orderDeliveries = orderDeliveries;
        this.productIds = productIds;
        this.productName = productName;
        this.quantity = quantity;

        // Check if orderStatus is null or empty, if so, set default value
        if (orderStatus == null || orderStatus.isEmpty()) {
            this.orderStatus = "ORDERED";
        } else {
            this.orderStatus = orderStatus;
        }
	}

	 public OrderData() {
	        this.orderStatus = "ORDERED"; // Set the default value
	    }


	@Override
	public String toString() {
		return "OrderData [id=" + id + ", finalPrice=" + finalPrice + ", email=" + email + ", name=" + name
				+ ", shippingaddress=" + shippingaddress + ", orderStatus=" + orderStatus + ", orderDeliveries="
				+ orderDeliveries + ", productIds=" + productIds + ", productName=" + productName + ", quantity="
				+ quantity + "]";
	}

	
   
    // Constructors and toString method
}
