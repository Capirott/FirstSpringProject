package com.erick.springboot.service;


import com.erick.springboot.model.ProductCustomer;

import java.util.List;

public interface ProductCustomerService {
	
	ProductCustomer findById(Long id);

	void saveProductCustomer(ProductCustomer productCustomer);

	void updateProductCustomer(ProductCustomer productCustomer);

	void deleteProductCustomerById(Long id);

	void deleteAllProductCustomers();

	List<ProductCustomer> findAllProductCustomers();

}