package edu.masterdata.controller;

import edu.masterdata.entity.Book;
import edu.masterdata.entity.Image;
import edu.masterdata.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public ModelAndView bookList(){
        ModelAndView modelAndView = new ModelAndView();
        List<Book> bookList = bookService.getListOfEntities();
        modelAndView.setViewName("/books");
        modelAndView.addObject("list",bookList);
        return modelAndView;
    }

    @RequestMapping(value = "/newbook", method = RequestMethod.GET)
    public ModelAndView addNewBookMethodGet(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/newbook");
        return modelAndView;
    }

    @RequestMapping(value = "/newbook", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Book addNewBookMethodPos(@RequestBody Book newBook){
        return bookService.writeBook(newBook);
    }

    @RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
    public ModelAndView showBook(@PathVariable(value = "id") String id){
        ModelAndView modelAndView = new ModelAndView();
        Book book = bookService.getBookbyId(Long.parseLong(id));
        modelAndView.setViewName("/onebook");
        modelAndView.addObject("book", book);
        return modelAndView;
    }

    @RequestMapping(value = "/update-book/{id}", method = RequestMethod.GET)
    public ModelAndView updateBook(@PathVariable(value = "id") String id){
        ModelAndView modelAndView = new ModelAndView();
        Book book = bookService.getBookbyId(Long.parseLong(id));
        modelAndView.setViewName("/update-book");
        modelAndView.addObject("book", book);
        return modelAndView;
    }

    @RequestMapping(value = "/update-book/{id}", method = RequestMethod.PUT, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Book updateBookMethodPos(@PathVariable(value = "id") String id, @RequestBody Book newBook, ModelMap modelMap){
        Book book = bookService.getBookbyId(Long.parseLong(id));
        modelMap.addAttribute("book", book);
        book.setId(book.getId());
        book.setName(newBook.getName());
        book.setAuthor(newBook.getAuthor());
        book.setDescription(newBook.getDescription());
        return bookService.updateBook(book);
    }

    @RequestMapping(value = "/delete-book/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable(value = "id") String id) {
        bookService.deleteBook(Long.parseLong(id));
        return "redirect:/books/books";
    }

    @RequestMapping(value = "/uploadimage/{id}", method = RequestMethod.POST)
    public String handleFileUpload(@PathVariable(value = "id") String id, @RequestParam CommonsMultipartFile fileToUpload){
        Book book = bookService.getBookbyId(Long.parseLong(id));
        if(book != null && fileToUpload != null){
            book.setImage(getImageInfo(fileToUpload));
            bookService.updateBook(book);
        }
        return "redirect:/books/book/".concat(id);
    }

    @RequestMapping(value = "/showimage/{id}", method = RequestMethod.GET)
    public String getImage(@PathVariable(value = "id") String id, HttpServletResponse response) throws IOException {
        Book book = bookService.getBookbyId(Long.parseLong(id));
        Image image = book.getImage();
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(image.getData());
        response.getOutputStream().close();
        return "redirect:/books/book/".concat(id);
    }

    private Image getImageInfo(CommonsMultipartFile file){
        Image image = new Image();
        image.setName(file.getOriginalFilename());
        image.setData(file.getBytes());
        return image;
    }
}
