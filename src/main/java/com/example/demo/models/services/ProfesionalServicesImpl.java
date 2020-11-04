package com.example.demo.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.demo.models.dao.IProfesionalDao;
import com.example.demo.models.entity.Profesional;

@Service
public class ProfesionalServicesImpl implements IProfesionalService{
	
	@Autowired		
	private IProfesionalDao profesionalDao;	

	@Override
	@Transactional(readOnly = true)
	public List<Profesional> findAll() {
		return (List<Profesional>) profesionalDao.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Profesional findById(Long id_profesional) {
		return profesionalDao.findById(id_profesional).orElse(null);
	}

	@Override
	@Transactional
	public Profesional save(Profesional profesional) {
		return profesionalDao.save(profesional);
	}

	@Override
	@Transactional
	public void delete(Long id_profesional) {
		profesionalDao.deleteById(id_profesional);
		
	}

}
