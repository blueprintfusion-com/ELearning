package com.student.elearning.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import javax.sql.DataSource;

@Repository
@Transactional
public class ExamResponseDao extends JdbcDaoSupport {

    @Autowired
    public ExamResponseDao(DataSource dataSource) {
        this.setDataSource(dataSource);
        this.getJdbcTemplate();
    }
}