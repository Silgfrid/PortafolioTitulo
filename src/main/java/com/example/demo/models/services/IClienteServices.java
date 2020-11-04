package com.example.demo.models.services;

import java.util.List;

import com.example.demo.models.entity.Cliente;

public interface IClienteServices {
		
		public List<Cliente> findAllClientes();
		
		public Cliente findById(int id_cliente);
		
		public Cliente save(Cliente cliente);
		
		public void delete(int id_cliente);
}