package com.example.flutter_backend.controller;

import com.example.flutter_backend.model.Users;
import com.example.flutter_backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin("*")
@RestController
@RequestMapping(path = "/users")

public class UserController  {
    @Autowired
    private UserService userService;
    @PostMapping("/save-users")
    public Object saveUsers(@RequestBody Users users){
        try {

            return  userService.saveUsers(users);
        }
        catch (Exception e){
        return e.getMessage();
        }
    }
    @GetMapping("")
    public List<Users> getUsers(){
        return   userService.getUsers();
    }
}
