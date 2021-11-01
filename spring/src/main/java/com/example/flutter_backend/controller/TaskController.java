package com.example.flutter_backend.controller;
import com.example.flutter_backend.model.TaskItem;
import com.example.flutter_backend.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin("*")
@RestController
@RequestMapping(path = "/tasks")
public class TaskController {
    @Autowired
    private TaskRepository taskRepository;

    @GetMapping
    public List<TaskItem> getTasks(){
        return taskRepository.findAll();
    }

    @PostMapping("/add")
    public TaskItem addTask(  @RequestBody TaskItem taskItem){
        return taskRepository.save(taskItem);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity updateTask(@PathVariable Long id){
        boolean exist = taskRepository.existsById(id);
        if(exist){
            TaskItem task = taskRepository.getById(id);
            boolean done = task.isDone();
            task.setDone(!done);
            taskRepository.save(task);
            return new ResponseEntity<>("Task is updated", HttpStatus.OK);
        }
        return new ResponseEntity<>("Task is not exist", HttpStatus.BAD_REQUEST);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity deleteTask(@PathVariable Long id){
        boolean exist = taskRepository.existsById(id);
        if(exist){
            taskRepository.deleteById(id);
            return new ResponseEntity<>("Task is deleted", HttpStatus.OK);
        }
        return new ResponseEntity<>("Task is not exist", HttpStatus.BAD_REQUEST);
    }
}
