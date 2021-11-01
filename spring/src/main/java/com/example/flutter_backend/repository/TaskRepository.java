package com.example.flutter_backend.repository;
import com.example.flutter_backend.model.TaskItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<TaskItem,Long> {
}