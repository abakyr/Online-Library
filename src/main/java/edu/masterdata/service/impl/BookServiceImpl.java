package edu.masterdata.service.impl;

import edu.masterdata.dao.BookDao;
import edu.masterdata.entity.Book;
import edu.masterdata.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@Qualifier("bookService")
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    @Override
    public Book writeBook(Book book) {
        return bookDao.create(book);
    }

    @Override
    public Book getBookbyId(long id) {
        return bookDao.getEntityById(id);
    }

    @Override
    public List<Book> getListOfEntities() {
        return bookDao.getListOfEntities();
    }

    @Override
    public List<Book> findBookByName(String authorName) {
        return bookDao.findEntityByName(authorName);
    }

    @Override
    public Book updateBook(Book book) {
        return bookDao.updateEntity(book);
    }

    @Override
    public void deleteBook(long id) {
        bookDao.deleteEntity(id);
    }
}
