package com.caesarjlee.cms.controllers;

import com.caesarjlee.cms.data_transfer_objects.EmployeeDto;
import com.caesarjlee.cms.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/employees")
public class EmployeeController{
    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    @PreAuthorize("hasRole('CEO')")
    public ResponseEntity <List <EmployeeDto>> getAllEmployees(){
        return ResponseEntity.ok(
            employeeService.getAllEmployees()
        );
    }

    @GetMapping("/department/{departmentId}")
    @PreAuthorize(
        "hasRole('chairperson') or" +
        "hasRole('directoe') or" +
        "hasRole('ceo') or" +
        "(  (" +
                "hasRole('clo') or hasRole('cto') or hasRole('coo') or" +
                "hasRole('cfo') or hasRole('cmo') or hasRole('cso') or" +
                "hasRole('chro') or hasRole('cio') or hasRole('cco')" +
           ") and #departmentId == principal.getDepartmentId()" +
        ")"
    )
    public ResponseEntity <List <EmployeeDto>> getEmployeeByDepartment(@PathVariable Integer departmentId){
        return ResponseEntity.ok(
            employeeService.getEmployeesByDepartment(departmentId)
        );
    }

    @GetMapping("/team/{teamId}")
    @PreAuthorize(
        "hasRole('chairperson') or" +
        "hasRole('directoe') or" +
        "hasRole('ceo') or" +
        "and #teamId == principal.getTeamId()"
        //and the same department officer and managers can view as well
    )
    public ResponseEntity <List <EmployeeDto>> getEmployeeByTeam(@PathVariable Integer teamId){
        return ResponseEntity.ok(
            employeeService.getEmployeesByTeam(teamId)
        );
    }
}