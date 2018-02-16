package com.manager.bookmanager.controller;

import com.manager.bookmanager.model.Book;
import com.manager.bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class BookController {

        private BookService bookService;

        @Autowired(required = true)  //автоматическое связывание
        @Qualifier(value = "bookService")
        public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

        @RequestMapping(value = "books", method = RequestMethod.GET)
        public String listBooks(Model model, @RequestParam("page") int page){
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookService.listBooks(page));
        model.addAttribute("totalPageCount", this.bookService.totalPageCount());
        model.addAttribute("pageNumber", page);

        return "books";
    }

        @RequestMapping(value = "/books/add", method = RequestMethod.POST)    //страницы
    public String addBook(@ModelAttribute("book") Book book)
    {
        this.bookService.addBook(book);

        return "redirect:/books";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)    //страницы
    public String editCurrentBook(@ModelAttribute("book") Book book)
    {
        this.bookService.updateBook(book);
        return "redirect:/books";
    }

        @RequestMapping("/remove/{id}")
        public String removeBook(@PathVariable("id") int id)    //страницы
        {
            this.bookService.removeBook(id);
            return "redirect:/books";
        }

        @RequestMapping(value = "editBook/{id}")
        public String editBook(@PathVariable("id") int id, Model model)    //страницы
        {

            model.addAttribute("book", this.bookService.getBookById(id));

            return "enterBookWindow";
        }

    @RequestMapping(value = "editStatus/{id}")
    public String editStatus(@PathVariable("id") int id, Model model)    //страницы
    {
        this.bookService.updateStatus(id);
        model.addAttribute("listBooks", this.bookService.listBooks(0)); //выводим заново все книги

        return "books";
    }

        @RequestMapping("bookdata/{id}")
        public String bookData(@PathVariable("id") int id, Model model)
        {
            model.addAttribute("book", this.bookService.getBookById(id));

            return "bookdata";
        }
}
