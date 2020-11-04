package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.models.entity.Profesional;
import com.example.demo.models.services.IProfesionalService;

@RestController
@CrossOrigin()
@RequestMapping({"/api"})
public class ProfesionalRestController {

	
	@Autowired
	private IProfesionalService profesionalService; 
	
	@GetMapping("/profesional")
	public List<Profesional> index(){
		return profesionalService.findAll();
		}
	
	
	@RequestMapping(value = "/profesional/{id_profesional}", method = RequestMethod.GET)
	public Profesional show(@PathVariable @Validated Long id_profesional) {
		return profesionalService.findById(id_profesional);
	}
	
	
	@RequestMapping(value = "/profesional", method = RequestMethod.POST)
	public Profesional create(@RequestBody  Profesional profesional) {
		return profesionalService.save(profesional);
	}
	
	@PutMapping("/profesional/{id_profesional}")
	@ResponseStatus(HttpStatus.CREATED)
	public Profesional update(@RequestBody Profesional profesional, @PathVariable Long id_profesional) {
		Profesional profesionalActual = profesionalService.findById(id_profesional);

		profesionalActual.setRut_profesional(profesional.getRut_profesional());
		profesionalActual.setDv_rut_profesional(profesional.getDv_rut_profesional());
		profesionalActual.setNombres_profesional(profesional.getNombres_profesional());
		profesionalActual.setAp_paterno_prof(profesional.getAp_paterno_prof());
		profesionalActual.setAp_materno_prof(profesional.getAp_materno_prof());
		profesionalActual.setFec_ingreso_prof(profesional.getFec_ingreso_prof());
		return profesionalService.save(profesionalActual);
		
	}
	
	@DeleteMapping("/profesional/{id_profesional}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void delete(@PathVariable Long id_profesional) {
		profesionalService.delete(id_profesional);
	}
	
	
	
}
