package com.valid;
import com.fasterxml.jackson.databind.ObjectMapper;

public class products {
	String prod_name;
	int prod_price;
	String prod_description;
	int prod_quantity;
	public products(String prod_name, int prod_price, String prod_description, int prod_quantity) {
		super();
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_description = prod_description;
		this.prod_quantity = prod_quantity;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_description() {
		return prod_description;
	}
	public void setProd_description(String prod_description) {
		this.prod_description = prod_description;
	}
	public int getProd_quantity() {
		return prod_quantity;
	}
	public void setProd_quantity(int prod_quantity) {
		this.prod_quantity = prod_quantity;
	}
	public products me() {
		return this;
	}
	public String toJSONString() {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            return objectMapper.writeValueAsString(this);
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately
            return null;
        }
    }
	public static products fromJSONString(String jsonString) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            return objectMapper.readValue(jsonString, products.class);
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately
            return null;
        }
    }
	 public products() {
	        //constructor Code
	    }
}
