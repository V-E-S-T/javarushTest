package com.manager.bookmanager.model;

import javax.persistence.*;

@Entity
@Table(name = "books")
public class Book {

        @Id
        @Column(name = "id")
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;

        @Column(name = "title")
        private String title;

        @Column(name = "author")
        private String author;

        @Column(name = "description")
        private String description;

        @Column(name = "printYear")
        private int printYear;

        @Column(name = "isbn")
        private int isbn;

        @Column(name = "readAlready")
        private boolean readAlready;

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public String getDescription() {
        return description;
    }

    public int getPrintYear() {
        return printYear;
    }

    public int getIsbn() {
        return isbn;
    }

    public boolean isReadAlready() {
        return readAlready;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrintYear(int printYear) {
        this.printYear = printYear;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public void setReadAlready(boolean readAlready) {
        this.readAlready = readAlready;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", bookTitle='" + title + '\'' +
                ", bookAuthor='" + author + '\'' +
                ", description=" + description +
                '}';
    }
}
