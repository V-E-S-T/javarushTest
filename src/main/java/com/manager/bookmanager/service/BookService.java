package com.manager.bookmanager.service;

import com.manager.bookmanager.model.Book;

import java.util.List;

public interface BookService {
    public void addBook(Book book);

    public void updateBook(Book book);

    public void removeBook(int id);

    public Book getBookById(int id);

    public List<Book> listBooks(int page);

    public void updateStatus(int id);

    public Long totalPageCount();
}
