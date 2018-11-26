package com.erick.springboot.service;


import com.erick.springboot.model.Customer;

import java.util.List;

public interface CustomerService {
	
	Customer findById(Long id);

	Customer findByName(String name);

	void saveCustomer(Customer customer);

	void updateCustomer(Customer customer);

	void deleteCustomerById(Long id);

	void deleteAllCustomers();

	List<Customer> findAllCustomers();

	boolean isCustomerExist(Customer customer);
}