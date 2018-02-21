package com.manager.bookmanager.controller;

import com.manager.bookmanager.model.Book;
import com.manager.bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String addBook(@ModelAttribute("book") Book book, @RequestParam("page") int page, RedirectAttributes redirectAttributes)
    {
        this.bookService.addBook(book);
        redirectAttributes.addAttribute("page", page);

        return "redirect:/books";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)    //страницы
    public String editCurrentBook(@ModelAttribute("book") Book book, @RequestParam("page") int page, RedirectAttributes redirectAttributes)
    {
        this.bookService.updateBook(book);
        redirectAttributes.addAttribute("page", page);
        return "redirect:/books";
    }

        @RequestMapping("/remove/{id}")
        public String removeBook(@PathVariable("id") int id, @RequestParam("page") int page, RedirectAttributes redirectAttributes)    //страницы
        {
            this.bookService.removeBook(id);

            redirectAttributes.addAttribute("page", page);
            return "redirect:/books";
        }

        @RequestMapping(value = "editBook/{id}")
        public String editBook(@PathVariable("id") int id, Model model, @RequestParam("page") int page, RedirectAttributes redirectAttributes)    //страницы
        {

            model.addAttribute("book", this.bookService.getBookById(id));
            model.addAttribute("pageNumber", page);
            redirectAttributes.addAttribute("page", page);

            return "enterBookWindow";
        }

    @RequestMapping(value = "editStatus/{id}")
    public String editStatus(@PathVariable("id") int id, Model model, @RequestParam("page") int page, RedirectAttributes redirectAttributes)    //страницы
    {
        this.bookService.updateStatus(id);
        model.addAttribute("listBooks", this.bookService.listBooks(page)); //выводим заново все книги
        redirectAttributes.addAttribute("page", page);

        return "redirect:/books";
    }

        @RequestMapping("bookdata/{id}")
        public String bookData(@PathVariable("id") int id, Model model)
        {
            model.addAttribute("book", this.bookService.getBookById(id));

            return "bookdata";
        }
}
