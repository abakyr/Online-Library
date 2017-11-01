package edu.masterdata.dao;

import org.hibernate.Session;
import java.util.List;

public interface BasicDao<T> {
    Session getCurrentSession();
    T create(T entity);
    T getEntityById(long id);
    List<T> getListOfEntities();
    List<T> findEntityByName(String authorName);
    T updateEntity(T entity);
    void deleteEntity(long id);
}
