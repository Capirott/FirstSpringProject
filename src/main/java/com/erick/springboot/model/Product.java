package com.erick.springboot.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="Product")
public class Product implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Column(name="name", nullable=false)
	private String name;

	@Column(name="price", nullable=false)
	private Float price;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Product product = (Product) o;

		if (id != null ? !id.equals(product.id) : product.id != null) return false;
		if (name != null ? !name.equals(product.name) : product.name != null) return false;
		return price != null ? price.equals(product.price) : product.price == null;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", age=" + price
				+ "]";
	}


}
