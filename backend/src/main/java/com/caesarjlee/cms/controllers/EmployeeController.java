package com.caesarjlee.cms.controllers;

import com.caesarjlee.cms.data_transfer_objects.EmployeeAllInfoDto;
import com.caesarjlee.cms.data_transfer_objects.EmployeeEmployeeInfoDto;
import com.caesarjlee.cms.data_transfer_objects.EmployeeManagerInfoDto;
import com.caesarjlee.cms.data_transfer_objects.EmployeeOwnInfoDto;
import com.caesarjlee.cms.services.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.file.AccessDeniedException;
import java.util.List;

@RestController
@RequestMapping("/api/employees")
@RequiredArgsConstructor
public class EmployeeController{
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/")
    @PreAuthorize("hasAnyRole('CHAIRPERSON', 'DIRECTOR', 'CEO')")
    public ResponseEntity <List <EmployeeAllInfoDto>> getAllEmployees(){
        return ResponseEntity.ok(employeeService.getAllEmployees());
    }

    @GetMapping("/department/{departmentId}")
    @PreAuthorize(
            "hasAnyRole('CHAIRPERSON', 'DIRECTOR', 'CEO', 'CLO', 'CTO', 'COO', " +
                        "'CFO', 'CMO', 'CSO', 'CHRO', 'CIO', 'CCO')"
    )
    public ResponseEntity <List <EmployeeManagerInfoDto>> getEmployeesByDepartment(
        @PathVariable Integer departmentId
    ) throws AccessDeniedException{
        return ResponseEntity.ok(employeeService.getEmployeesByDepartment(departmentId));
    }

    @GetMapping("/team/manager/{teamId}")
    @PreAuthorize("hasRole('MANAGER')")
    public ResponseEntity <List <EmployeeManagerInfoDto>> getEmployeesByTeamAsManager(
        @PathVariable Integer teamId
    ) throws AccessDeniedException{
        return ResponseEntity.ok(employeeService.getEmployeesByTeamAsManager(teamId));
    }

    @GetMapping("/team/employee/{teamId}")
    @PreAuthorize("hasRole('EMPLOYEE)")
    public ResponseEntity <List <EmployeeEmployeeInfoDto>> getEmployeeByTeamAsEmployee(
        @PathVariable Integer teamId
    ) throws AccessDeniedException {
        return ResponseEntity.ok(employeeService.getEmployeesByTeamAsEmployee(teamId));
    }


    @GetMapping("/self/{id}")
    @PreAuthorize("authentication.principal.username == #id.toString()")
    public ResponseEntity <EmployeeOwnInfoDto> getSelfInfo(
        @PathVariable Long id
    ) throws AccessDeniedException{
        return ResponseEntity.ok(employeeService.getEmployeeOwnInfoById(id));
    }
}