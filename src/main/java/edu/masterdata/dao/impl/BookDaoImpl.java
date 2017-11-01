package edu.masterdata.dao.impl;

import edu.masterdata.dao.BookDao;
import edu.masterdata.entity.Book;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("bookDao")
public class BookDaoImpl extends BasicDaoImpl<Book> implements BookDao {

    public BookDaoImpl() {
        super(Book.class);
    }
}
