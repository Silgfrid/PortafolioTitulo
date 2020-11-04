package com.example.demo.models.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="PROFESIONAL")
public class Profesional implements Serializable {


	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name="ID_PROFESIONAL")
	private Long id_profesional;
	
	@Column(name="RUT_PROFESIONAL")
	private int rut_profesional;
	
	@Column(name="DV_RUT_PROFESIONAL")
	private String dv_rut_profesional;
	
	@Column(name="NOMBRES_PROFESIONAL")
	private String nombres_profesional;
	
	@Column(name="AP_PATERNO_PROF")
	private String ap_paterno_prof;
	
	@Column(name="AP_MATERNO_PROF")
	private String ap_materno_prof;
	
	@Column(name="FEC_INGRESO_PROF")
	@Temporal(TemporalType.DATE)
	private Date fec_ingreso_prof;
	
	
	public Long getId_profesional() {
		return id_profesional;
	}
	public void setId_profesional(Long id_profesional) {
		this.id_profesional = id_profesional;
	}
	public int getRut_profesional() {
		return rut_profesional;
	}
	public void setRut_profesional(int rut_profesional) {
		this.rut_profesional = rut_profesional;
	}
	public String getDv_rut_profesional() {
		return dv_rut_profesional;
	}
	public void setDv_rut_profesional(String dv_rut_profesioanl) {
		this.dv_rut_profesional = dv_rut_profesioanl;
	}
	public String getNombres_profesional() {
		return nombres_profesional;
	}
	public void setNombres_profesional(String nombres_profesional) {
		this.nombres_profesional = nombres_profesional;
	}
	public String getAp_paterno_prof() {
		return ap_paterno_prof;
	}
	public void setAp_paterno_prof(String ap_paterno_prof) {
		this.ap_paterno_prof = ap_paterno_prof;
	}
	public String getAp_materno_prof() {
		return ap_materno_prof;
	}
	public void setAp_materno_prof(String ap_materno_prof) {
		this.ap_materno_prof = ap_materno_prof;
	}
	public Date getFec_ingreso_prof() {
		return fec_ingreso_prof;
	}
	public void setFec_ingreso_prof(Date fec_ingreso_prof) {
		this.fec_ingreso_prof = fec_ingreso_prof;
	}
	public Profesional(Long id_profesional, int rut_profesional, String dv_rut_profesional, String nombres_profesional,
			String ap_paterno_prof, String ap_materno_prof, Date fec_ingreso_prof) {
		super();
		this.id_profesional = id_profesional;
		this.rut_profesional = rut_profesional;
		this.dv_rut_profesional = dv_rut_profesional;
		this.nombres_profesional = nombres_profesional;
		this.ap_paterno_prof = ap_paterno_prof;
		this.ap_materno_prof = ap_materno_prof;
		this.fec_ingreso_prof = fec_ingreso_prof;
	}
	public Profesional() {
		super();
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	
}
