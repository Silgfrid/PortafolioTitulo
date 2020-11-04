package com.example.demo.models.services;

import java.util.List;

import com.example.demo.models.entity.Profesional;

public interface IProfesionalService {
	
	public List<Profesional> findAll();
	
	public Profesional findById(Long id_profesional);
	
	public Profesional save(Profesional profesional);
	
	public void delete(Long id_profesional);

}
