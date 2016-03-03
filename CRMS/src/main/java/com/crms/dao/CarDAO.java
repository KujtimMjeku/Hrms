package com.crms.dao;

import org.springframework.data.repository.CrudRepository;

import com.crms.entity.Car;

public interface CarDAO extends CrudRepository<Car, Integer> {

}
