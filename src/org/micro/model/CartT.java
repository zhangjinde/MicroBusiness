package org.micro.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CartT entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CART_T")
public class CartT implements java.io.Serializable {

	// Fields

	private String cartId;
	private String productId;
	private String customerId;
	private String telephone;
	private String state;
	private Date createDate;
	private String num;

	// Constructors

	/** default constructor */
	public CartT() {
	}

	/** minimal constructor */
	public CartT(String cartId) {
		this.cartId = cartId;
	}

	/** full constructor */
	public CartT(String cartId, String productId, String customerId,
			String telephone, String state, Date createDate, String num) {
		this.cartId = cartId;
		this.productId = productId;
		this.customerId = customerId;
		this.telephone = telephone;
		this.state = state;
		this.createDate = createDate;
		this.num = num;
	}

	// Property accessors
	@Id
	@Column(name = "CART_ID", unique = true, nullable = false, length = 16)
	public String getCartId() {
		return this.cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	@Column(name = "PRODUCT_ID", length = 16)
	public String getProductId() {
		return this.productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@Column(name = "CUSTOMER_ID", length = 12)
	public String getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	@Column(name = "TELEPHONE", length = 12)
	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "STATE", length = 3)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "CREATE_DATE", length = 7)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "NUM", length = 2)
	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

}