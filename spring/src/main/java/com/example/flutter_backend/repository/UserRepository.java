package com.example.flutter_backend.repository;

import com.example.flutter_backend.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Users, String>{
}
