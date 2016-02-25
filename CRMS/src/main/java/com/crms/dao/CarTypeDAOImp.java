package com.crms.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.crms.entity.CarType;

@Repository
public class CarTypeDAOImp implements CarTypeDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@PersistenceContext
	private EntityManager em;

	public CarTypeDAOImp() {

	}
	public CarTypeDAOImp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public void insert(CarType carType) {
		//sessionFactory.getCurrentSession().saveOrUpdate(carType);
		em.persist(carType);

	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CarType> findAll() {
	/*	return sessionFactory.getCurrentSession()
				.createCriteria(CarType.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();*/
		
		return em.createQuery("Select t from CarType t").getResultList();
	}
	
	
	@Override
	@Transactional
	public CarType find(int id) {
		return (CarType) sessionFactory.getCurrentSession().get(CarType.class, id);
	}
	
	@Override
	@Transactional
	public void delete(int id) {
		sessionFactory.getCurrentSession().delete(find(id));
	}
	
	@Override
	@Transactional
	public Long numberOfRows() {
		Criteria crit=sessionFactory.getCurrentSession().createCriteria(CarType.class);
		return (Long) crit.setProjection(Projections.rowCount()).uniqueResult();
	}
	@Override
	@Transactional
	public List<Integer> pagesList(int perPage)
	{
		List<Integer> pList=new ArrayList<>();
		Long rows=numberOfRows();
		for (int i = 1; i <= Math.toIntExact(rows)/perPage; i++) {
			pList.add(i);
		}
		return pList;
	}

}
