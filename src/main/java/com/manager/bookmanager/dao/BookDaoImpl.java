package com.manager.bookmanager.dao;

import com.manager.bookmanager.model.Book;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao{
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("Book successfully saved. Book details: " + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        if (book.isReadAlready())
        {
            book.setReadAlready(false);
        }

        session.update(book);
        logger.info("Book successfully update. Book details: " + book);

    }

    @Override
    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, id);

        if(book!=null){
            session.delete(book);
        }
        logger.info("Book successfully removed. Book details: " + book);
    }

    @Override
    public Book getBookById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, id);
        logger.info("Book successfully loaded. Book details: " + book);

        return book;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks(int page) {
        Session session = this.sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Book.class);
        criteria.setFirstResult((page - 1) * 10);
        criteria.setMaxResults(10);
        List<Book> bookList = (List<Book>)criteria.list();
        session.cancelQuery();

        for(Book book: bookList){
            logger.info("Book list: " + book);
        }

        return bookList;
    }

    @Override
    public Long totalPageCount() {
        Session session = this.sessionFactory.getCurrentSession();
        Criteria criteriaCount = session.createCriteria(Book.class);
        criteriaCount.setProjection(Projections.rowCount());
        Long totalPageCount = (Long)criteriaCount.uniqueResult();

        return Double.valueOf(Math.ceil(totalPageCount/10)).longValue();
    }

    @Override
    public void updateStatus(int id) {
        Session session = this.sessionFactory.getCurrentSession();

       session.createQuery(("update Book set readAlready = '1' where id = :idParam")).setParameter("idParam", id).executeUpdate();

    }

}
