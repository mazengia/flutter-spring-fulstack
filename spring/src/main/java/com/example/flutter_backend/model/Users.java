package com.example.flutter_backend.model;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;

@AllArgsConstructor
@Data
@NoArgsConstructor
@Entity
public class Users {
    @Id
    String userName;
    String password;
    String firstName;
    String lastName;
//    int Phone;
}
