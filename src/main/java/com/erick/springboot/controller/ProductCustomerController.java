package com.erick.springboot.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.erick.springboot.model.ProductCustomer;
import com.erick.springboot.service.ProductCustomerService;
import com.erick.springboot.util.CustomErrorType;

@RestController
@RequestMapping("/api")
public class ProductCustomerController {

	public static final Logger logger = LoggerFactory.getLogger(ProductCustomerController.class);

	@Autowired
	ProductCustomerService productCustomerService; //Service which will do all data retrieval/manipulation work

	// -------------------Retrieve All ProductCustomers---------------------------------------------

	@RequestMapping(value = "/productCustomer/", method = RequestMethod.GET)
	public ResponseEntity<List<ProductCustomer>> listAllProductCustomers() {
		List<ProductCustomer> productCustomers = productCustomerService.findAllProductCustomers();
		if (productCustomers.isEmpty()) {
			return new ResponseEntity<List<ProductCustomer>>(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		return new ResponseEntity<List<ProductCustomer>>(productCustomers, HttpStatus.OK);
	}

	// -------------------Retrieve Single ProductCustomer------------------------------------------

	@RequestMapping(value = "/productCustomer/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> getProductCustomer(@PathVariable("id") long id) {
		logger.info("Fetching ProductCustomer with id {}", id);
		ProductCustomer productCustomer = productCustomerService.findById(id);
		if (productCustomer == null) {
			logger.error("ProductCustomer with id {} not found.", id);
			return new ResponseEntity<Object>(new CustomErrorType("ProductCustomer with id " + id 
					+ " not found"), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<ProductCustomer>(productCustomer, HttpStatus.OK);
	}

	// -------------------Create a ProductCustomer-------------------------------------------

	@RequestMapping(value = "/productCustomer/", method = RequestMethod.POST)
	public ResponseEntity<?> createProductCustomer(@RequestBody ProductCustomer productCustomer, UriComponentsBuilder ucBuilder) {
		logger.info("Creating ProductCustomer : {}", productCustomer);

		productCustomer.setCustomer(productCustomer.getCustomer());
		productCustomer.setAmount(productCustomer.getAmount());
		productCustomer.setProduct(productCustomer.getProduct());	

		productCustomerService.saveProductCustomer(productCustomer);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/api/productCustomer/{id}").buildAndExpand(productCustomer.getId()).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	// ------------------- Update a ProductCustomer ------------------------------------------------

	@RequestMapping(value = "/productCustomer/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateProductCustomer(@PathVariable("id") long id, @RequestBody ProductCustomer productCustomer) {
		logger.info("Updating ProductCustomer with id {}", id);

		ProductCustomer currentProductCustomer = productCustomerService.findById(id);

		if (currentProductCustomer == null) {
			logger.error("Unable to update. ProductCustomer with id {} not found.", id);
			return new ResponseEntity<Object>(new CustomErrorType("Unable to upate. ProductCustomer with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}

		currentProductCustomer.setCustomer(productCustomer.getCustomer());
		currentProductCustomer.setAmount(productCustomer.getAmount());
		currentProductCustomer.setProduct(productCustomer.getProduct());

		productCustomerService.updateProductCustomer(currentProductCustomer);
		return new ResponseEntity<ProductCustomer>(currentProductCustomer, HttpStatus.OK);
	}

	// ------------------- Delete a ProductCustomer-----------------------------------------

	@RequestMapping(value = "/productCustomer/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteProductCustomer(@PathVariable("id") long id) {
		logger.info("Fetching & Deleting ProductCustomer with id {}", id);

		ProductCustomer productCustomer = productCustomerService.findById(id);
		if (productCustomer == null) {
			logger.error("Unable to delete. ProductCustomer with id {} not found.", id);
			return new ResponseEntity<Object>(new CustomErrorType("Unable to delete. ProductCustomer with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}
		productCustomerService.deleteProductCustomerById(id);
		return new ResponseEntity<ProductCustomer>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Delete All ProductCustomers-----------------------------

	@RequestMapping(value = "/productCustomer/", method = RequestMethod.DELETE)
	public ResponseEntity<ProductCustomer> deleteAllProductCustomers() {
		logger.info("Deleting All ProductCustomers");

		productCustomerService.deleteAllProductCustomers();
		return new ResponseEntity<ProductCustomer>(HttpStatus.NO_CONTENT);
	}

}