package com.erick.springboot.service;


import com.erick.springboot.model.Product;

import java.util.List;

public interface ProductService {
	
	Product findById(Long id);

	Product findByName(String name);

	void saveProduct(Product product);

	void updateProduct(Product product);

	void deleteProductById(Long id);

	void deleteAllProducts();

	List<Product> findAllProducts();

	boolean isProductExist(Product product);
}