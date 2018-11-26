package com.erick.springboot.service;

import java.util.List;

import com.erick.springboot.model.Product;
import com.erick.springboot.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepository;

	public Product findById(Long id) {
		return productRepository.findOne(id);
	}

	public Product findByName(String name) {
		return productRepository.findByName(name);
	}

	public void saveProduct(Product product) {
		productRepository.save(product);
	}

	public void updateProduct(Product product){
		saveProduct(product);
	}

	public void deleteProductById(Long id){
		productRepository.delete(id);
	}

	public void deleteAllProducts(){
		productRepository.deleteAll();
	}

	public List<Product> findAllProducts(){
		return productRepository.findAll();
	}

	public boolean isProductExist(Product product) {
		return findByName(product.getName()) != null;
	}

}
