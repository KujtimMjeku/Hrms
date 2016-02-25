package com.crms.dao;

import java.util.List;

import com.crms.entity.CarType;

public interface CarTypeDAO
{
	public void insert(CarType carType);
	public List<CarType> findAll();
	public CarType find(int id);
	public void delete(int id);
	public Long numberOfRows();
	public List<Integer> pagesList(int perPage);

}
