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

import com.example.demo.models.entity.Cliente;
import com.example.demo.models.services.IClienteServices;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api")
public class ClienteRestController  {

	
	@Autowired
	private IClienteServices clienteServices; 
	
	@GetMapping("/clientes")
	public List<Cliente> index(){
		return clienteServices.findAllClientes();
		}
	
	
	@RequestMapping(value = "/clientes/{id_cliente}", method = RequestMethod.GET)
	public Cliente show(@PathVariable @Validated int id_cliente) {
		return clienteServices.findById(id_cliente);
	}
	
	
	@RequestMapping(value = "cliente", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public Cliente create(@RequestBody Cliente cliente) {
		return clienteServices.save(cliente);
	}
	
	@PutMapping("/clientes/{id_cliente}")
	@ResponseStatus(HttpStatus.CREATED)
	public Cliente update(@RequestBody Cliente cliente, @PathVariable int id_cliente) {
		Cliente clienteActual = clienteServices.findById(id_cliente);

		clienteActual.setRut_cliente(cliente.getRut_cliente());
		clienteActual.setDv_cliente(cliente.getDv_cliente());
		clienteActual.setRazon_social(cliente.getRazon_social());
		clienteActual.setTipo_contrato(cliente.getTipo_contrato());
		clienteActual.setStatus_cliente(cliente.getStatus_cliente());
		return clienteServices.save(clienteActual);
		
	}
	
	@DeleteMapping("/clientes/{id_cliente}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void delete(@PathVariable int id_cliente) {
		clienteServices.delete(id_cliente);
	}
	
	
	
}
