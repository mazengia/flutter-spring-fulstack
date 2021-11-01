package com.example.flutter_backend.service;

import com.example.flutter_backend.model.Users;
import com.example.flutter_backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<Users> getUsers(){
        return  userRepository.findAll();
    }
public Users saveUsers(Users user){
     return userRepository.save(user);

}
}
