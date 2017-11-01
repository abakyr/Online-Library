package edu.masterdata.dao.impl;

import edu.masterdata.dao.BasicDao;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import java.util.List;

@Transactional
public abstract class BasicDaoImpl<T> implements BasicDao<T> {
    private final Class<T> entityClass;

    @Autowired
    protected SessionFactory sessionFactory;

    protected BasicDaoImpl(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    @Override
    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public T create(T entity) {
        getCurrentSession().save(entity);
        return entity;
    }

    @Override
    public T getEntityById(long id) {
        return getCurrentSession().get(entityClass, id);
    }

    @Override
    public List<T> getListOfEntities() {
        CriteriaBuilder builder = sessionFactory.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = builder.createQuery(entityClass);
        Root<T> root = criteriaQuery.from(entityClass);
        criteriaQuery.select(root);
        return sessionFactory.getCurrentSession().createQuery(criteriaQuery).list();
    }

    @Override
    public List<T> findEntityByName(String authorName) {
        CriteriaBuilder builder = sessionFactory.getCriteriaBuilder();
        CriteriaQuery<T> criteria = builder.createQuery(entityClass);
        Root<T> root = criteria.from(entityClass);
        criteria.select(root).where(builder.equal(root.get("name"), authorName));
        return sessionFactory.getCurrentSession().createQuery(criteria).list();
    }

    @Override
    public T updateEntity(T entity) {
        getCurrentSession().update(entity);
        return entity;
    }

    @Override
    public void deleteEntity(long id) {
        getCurrentSession().delete(getCurrentSession().get(entityClass,id));
    }
}
