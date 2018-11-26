package com.erick.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.erick.springboot.model.ProductCustomer;
import com.erick.springboot.repositories.ProductCustomerRepository;



@Service("productCustomerService")
@Transactional
public class ProductCustomerServiceImpl implements ProductCustomerService{

	@Autowired
	private ProductCustomerRepository productCustomerRepository;

	public ProductCustomer findById(Long id) {
		return productCustomerRepository.findOne(id);
	}

	public void saveProductCustomer(ProductCustomer productCustomer) {
		productCustomerRepository.save(productCustomer);
	}

	public void updateProductCustomer(ProductCustomer productCustomer){
		saveProductCustomer(productCustomer);
	}

	public void deleteProductCustomerById(Long id){
		productCustomerRepository.delete(id);
	}

	public void deleteAllProductCustomers(){
		productCustomerRepository.deleteAll();
	}

	public List<ProductCustomer> findAllProductCustomers(){
		return productCustomerRepository.findAll();
	}

}
