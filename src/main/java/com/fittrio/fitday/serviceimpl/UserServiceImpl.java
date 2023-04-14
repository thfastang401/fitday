package com.fittrio.fitday.serviceimpl;

import com.fittrio.fitday.dao.UserDAO;
import com.fittrio.fitday.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO dao;
}
