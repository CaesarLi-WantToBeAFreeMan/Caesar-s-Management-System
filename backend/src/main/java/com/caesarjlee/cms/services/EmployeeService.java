package com.caesarjlee.cms.services;

import com.caesarjlee.cms.data_transfer_objects.EmployeeDto;
import com.caesarjlee.cms.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EmployeeService{
    @Autowired
    private UserRepository userRepository;

    public List <EmployeeDto> getAllEmployees(){
        return userRepository   .findAll()
                                .stream()
                                .map(
                                    user -> new EmployeeDto(
                                        user.getId(),
                                        user.getFirstName(),
                                        user.getLastName(),
                                        user.getEmail(),
                                        user.getPhone()
                                    )
                                )
                                .collect(Collectors.toList());
    }

    public List <EmployeeDto> getEmployeesByDepartment(Integer departmentId){
        return userRepository   .findAll()
                                .stream()
                                .filter(
                                    user -> user.getDepartmentId() != null &&
                                            user    .getDepartmentId()
                                                    .equals(departmentId)
                                )
                                .map(
                                    user -> new EmployeeDto(
                                        user.getId(),
                                        user.getFirstName(),
                                        user.getLastName(),
                                        user.getEmail(),
                                        user.getPhone()
                                    )
                                )
                                .collect(Collectors.toList());
    }

    public List <EmployeeDto> getEmployeesByTeam(Integer teamId){
        return userRepository   .findAll()
                                .stream()
                                .filter(
                                    user -> user.getTeamId() != null &&
                                            user    .getTeamId()
                                                    .equals(teamId)
                                )
                                .map(
                                    user -> new EmployeeDto(
                                        user.getId(),
                                        user.getFirstName(),
                                        user.getLastName(),
                                        user.getEmail(),
                                        user.getPhone()
                                    )
                                )
                                .collect(Collectors.toList());
    }
}