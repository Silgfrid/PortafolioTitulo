package com.example.demo.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.models.dao.IClienteDao;
import com.example.demo.models.entity.Cliente;

@Service
public class ClienteServicesImpl implements IClienteServices{
	
	@Autowired		
	private IClienteDao clienteDao;	

	@Override
	@Transactional(readOnly = true)
	public List<Cliente> findAllClientes() {
		return (List<Cliente>) clienteDao.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Cliente findById(int id_cliente) {
		return clienteDao.findById(id_cliente).orElse(null);
	}

	@Override
	@Transactional
	public Cliente save(Cliente cliente) {
		return clienteDao.save(cliente);
	}

	@Override
	@Transactional
	public void delete(int id_cliente) {
		clienteDao.deleteById(id_cliente);
		
	}

}
