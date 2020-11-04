package com.example.demo.models.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="CLIENTE")
public class Cliente implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name="ID_CLIENTE")
	private int id_cliente;
	
	@Column(name="RUT_CLIENTE")
	private int rut_cliente;
	
	@Column(name="DV_CLIENTE")
	private String dv_cliente;
	
	@Column(name="RAZON_SOCIAL")
	private String razon_social;
	
	@Column(name="TIPO_CONTRATO")
	private int tipo_contrato;
	
	@Column(name="STATUS_CLIENTE")
	private int status_cliente;


	public int getRut_cliente() {
		return rut_cliente;
	}

	public void setRut_cliente(int rut_cliente) {
		this.rut_cliente = rut_cliente;
	}

	public String getDv_cliente() {
		return dv_cliente;
	}

	public void setDv_cliente(String dv_cliente) {
		this.dv_cliente = dv_cliente;
	}

	public String getRazon_social() {
		return razon_social;
	}

	public void setRazon_social(String razon_social) {
		this.razon_social = razon_social;
	}

	public int getTipo_contrato() {
		return tipo_contrato;
	}

	public void setTipo_contrato(int tipo_contrato) {
		this.tipo_contrato = tipo_contrato;
	}

	public int getStatus_cliente() {
		return status_cliente;
	}

	public void setStatus_cliente(int status_cliente) {
		this.status_cliente = status_cliente;
	}
	
	

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public Cliente(int id_cliente,int rut_cliente, String dv_cliente, String razon_social, int tipo_contrato, int status_cliente) {
		super();
		this.id_cliente = id_cliente;
		this.rut_cliente = rut_cliente;
		this.dv_cliente = dv_cliente;
		this.razon_social = razon_social;
		this.tipo_contrato = tipo_contrato;
		this.status_cliente = status_cliente;
	}
	
	public Cliente() {
		super();
	}

	private static final long serialVersionUID = 1L;
	
}
