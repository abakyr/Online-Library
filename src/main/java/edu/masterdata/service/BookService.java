package edu.masterdata.service;

import edu.masterdata.entity.Book;
import java.util.List;

public interface BookService {
    Book writeBook(Book book);
    Book getBookbyId(long id);
    List<Book> getListOfEntities();
    List<Book> findBookByName(String authorName);
    Book updateBook(Book book);
    void deleteBook(long id);
}
