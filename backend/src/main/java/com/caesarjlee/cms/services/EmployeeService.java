package com.caesarjlee.cms.services;

import com.caesarjlee.cms.data_transfer_objects.EmployeeAllInfoDto;
import com.caesarjlee.cms.data_transfer_objects.EmployeeEmployeeInfoDto;
import com.caesarjlee.cms.data_transfer_objects.EmployeeManagerInfoDto;
import com.caesarjlee.cms.data_transfer_objects.EmployeeOwnInfoDto;
import com.caesarjlee.cms.models.*;
import com.caesarjlee.cms.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class EmployeeService{
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private GenderRepository genderRepository;

    @Autowired
    private DiplomaRepository diplomaRepository;

    @Autowired
    private DepartmentRepository departmentRepository;

    @Autowired
    private TeamRepository teamRepository;

    @Autowired
    private CurrencyRepository currencyRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private NationalityRepository nationalityRepository;

    private static final Map <String, Integer> officerDepartmentMap = Map.of(
        "CLO", 1,   "CTO", 2,   "COO", 3,
        "CFO", 4,   "CMO", 5,   "CSO", 6,
        "CHRO", 7,  "CIO", 8,   "CCO", 9
    );

    public List <EmployeeAllInfoDto> getAllEmployees(){
        return userRepository   .findAll()
                                .stream()
                                .map(this::toAllInfoDto)
                                .collect(Collectors.toList());
    }

    public List <EmployeeManagerInfoDto> getEmployeesByDepartment(Integer departmentId) throws AccessDeniedException {
        String role = getRole(SecurityContextHolder.getContext().getAuthentication());
        if(officerDepartmentMap.containsKey(role) && !officerDepartmentMap.get(role).equals(departmentId))
            throw new AccessDeniedException("you do not have authorization to access this department");
        return userRepository   .findByDepartmentId(departmentId, Pageable.unpaged())
                                .stream()
                                .map(this::toManagerInfoDto)
                                .collect(Collectors.toList());
    }

    public List <EmployeeManagerInfoDto> getEmployeesByTeamAsManager(Integer teamId) throws AccessDeniedException {
        Long currentUserId = getCurrentUserId();
        Team team = teamRepository  .findById(teamId)
                                    .orElseThrow(() -> new IllegalArgumentException("team not found"));
        if(!team.getManagerId().equals(currentUserId))
            throw new AccessDeniedException("you are not the manager of this team");
        return userRepository   .findByTeamId(teamId, Pageable.unpaged())
                                .stream()
                                .map(this::toManagerInfoDto)
                                .collect(Collectors.toList());
    }

    public List <EmployeeEmployeeInfoDto> getEmployeesByTeamAsEmployee(Integer teamId) throws AccessDeniedException {
        User currentUser = userRepository   .findById(getCurrentUserId())
                                            .orElseThrow(() -> new IllegalArgumentException("user not found"));
        if(!currentUser.getTeamId().equals(teamId))
            throw new AccessDeniedException("you are not a memeber of this team");
        return userRepository   .findByTeamId(teamId, Pageable.unpaged())
                                .stream()
                                .map(this::toEmployeeInfoDto)
                                .collect(Collectors.toList());
    }

    public EmployeeOwnInfoDto getEmployeeOwnInfoById(Long id) throws AccessDeniedException {
        Long currentUserId = getCurrentUserId();
        if(!id.equals(currentUserId))
            throw new AccessDeniedException("you cannot access somebody else's all info");
        return userRepository   .findById(id)
                                .map(this::toOwnInfoDto)
                                .orElseThrow(() -> new IllegalArgumentException("user not found"));
    }

    private String getRole(Authentication authentication){
        return authentication   .getAuthorities()
                                .stream()
                                .map(
                                    auth -> auth.getAuthority()
                                    .replace("ROLE_", "")
                                )
                                .findFirst()
                                .orElseThrow(() -> new IllegalArgumentException("role not found"));
    }

    private Long getCurrentUserId(){
        return userRepository   .findByUsername(
                                    SecurityContextHolder   .getContext()
                                                            .getAuthentication()
                                                            .getName()
                                )
                                .orElseThrow(() -> new IllegalArgumentException("user not found"))
                                .getId();
    }

    private EmployeeAllInfoDto toAllInfoDto(User user){
        return new EmployeeAllInfoDto(
                user.getUsername(),
                user.getFirstName(),
                user.getLastName(),
                genderRepository    .findById(
                                        user.getGenderId()
                                    )
                                    .map(Gender::getName)
                                    .orElse(null),
                diplomaRepository   .findById(
                                        user.getDiplomaId()
                                    )
                                    .map(Diploma::getName)
                                    .orElse(null),
                departmentRepository    .findById(
                                            user.getDepartmentId()
                                        )
                                        .map(Department::getName)
                                        .orElse(null),
                teamRepository  .findById(
                                    user.getTeamId()
                                )
                                .map(Team::getName)
                                .orElse(null),
                roleRepository  .findById(user.getRoleId())
                                .map(Role::getName)
                                .orElse(null),
                user.getHireDate(),
                user.getSalary(),
                currencyRepository  .findById(user.getCurrencyId())
                                    .map(Currency::getName)
                                    .orElse(null),
                languageRepository  .findById((user.getFirstLanguageId()))
                                    .map(Language::getName)
                                    .orElse(null),
                user.getSecondLanguageId()  != null
                                            ? languageRepository    .findById(
                                                                        user.getSecondLanguageId()
                                                                    )
                                                                    .map(Language::getName)
                                                                    .orElse(null)
                                            : null,
                user.getThirdLanguageId()   != null
                                            ? languageRepository    .findById(
                                                                        user.getThirdLanguageId()
                                                                    )
                                                                    .map(Language::getName)
                                                                    .orElse(null)
                                            : null,
                nationalityRepository   .findById(user.getFirstNationalityId())
                                        .map(Nationality::getName)
                                        .orElse(null),
                user.getSecondNationalityId()   != null
                                                ? nationalityRepository .findById(
                                                                            user.getSecondNationalityId()
                                                                        )
                                                                        .map(Nationality::getName)
                                                                        .orElse(null)
                                                : null,
                user.getStatus(),
                user.getIcon(),
                user.getDescription(),
                user.getCreatedAt(),
                user.getUpdatedAt()
        );
    }

    private EmployeeManagerInfoDto toManagerInfoDto(User user){
        return new EmployeeManagerInfoDto(
                user.getUsername(),
                user.getFirstName(),
                user.getLastName(),
                genderRepository    .findById(user.getGenderId())
                                    .map(Gender::getName)
                                    .orElse(null),
                diplomaRepository   .findById(user.getDiplomaId())
                                    .map(Diploma::getName)
                                    .orElse(null),
                departmentRepository    .findById(user.getDepartmentId())
                                        .map(Department::getName)
                                        .orElse(null),
                teamRepository  .findById(user.getTeamId())
                                .map(Team::getName)
                                .orElse(null),
                roleRepository  .findById(user.getRoleId())
                                .map(Role::getName)
                                .orElse(null),
                languageRepository  .findById((user.getFirstLanguageId()))
                                    .map(Language::getName)
                                    .orElse(null),
                user.getSecondLanguageId()  != null
                                            ? languageRepository    .findById(
                                                                        user.getSecondLanguageId()
                                                                    )
                                                                    .map(Language::getName)
                                                                    .orElse(null)
                                            : null,
                user.getThirdLanguageId()   != null
                                            ? languageRepository    .findById(
                                                                        user.getThirdLanguageId()
                                                                    )
                                                                    .map(Language::getName)
                                                                    .orElse(null)
                                            : null,
                user.getStatus(),
                user.getIcon(),
                user.getDescription()
        );
    }

    private EmployeeEmployeeInfoDto toEmployeeInfoDto(User user){
        return new EmployeeEmployeeInfoDto(
            user.getFirstName(),
            user.getLastName(),
            genderRepository    .findById(user.getGenderId())
                                .map(Gender::getName)
                                .orElse(null),
            diplomaRepository   .findById(user.getDiplomaId())
                                .map(Diploma::getName)
                                .orElse(null),
            departmentRepository    .findById(user.getDepartmentId())
                                    .map(Department::getName)
                                    .orElse(null),
            teamRepository  .findById(
                                user.getTeamId()
                            )
                            .map(Team::getName)
                            .orElse(null),
            roleRepository  .findById(user.getRoleId())
                            .map(Role::getName)
                            .orElse(null),
            languageRepository  .findById((user.getFirstLanguageId()))
                                .map(Language::getName)
                                .orElse(null),
            user.getSecondLanguageId()  != null
                                        ? languageRepository    .findById(
                                                                    user.getSecondLanguageId()
                                                                )
                                                                .map(Language::getName)
                                                                .orElse(null)
                                        : null,
            user.getThirdLanguageId()   != null
                                        ? languageRepository    .findById(
                                                                    user.getThirdLanguageId()
                                                                )
                                                                .map(Language::getName)
                                                                .orElse(null)
                                        : null,
            user.getIcon(),
            user.getDescription()
        );
    }

    private EmployeeOwnInfoDto toOwnInfoDto(User user){
        return new EmployeeOwnInfoDto(
            user.getId(),
            user.getUsername(),
            user.getPassword(),
            user.getFirstName(),
            user.getLastName(),
            genderRepository    .findById(
                                    user.getGenderId()
                                )
                                .map(Gender::getName)
                                .orElse(null),
            diplomaRepository   .findById(
                                    user.getDiplomaId()
                                )
                                .map(Diploma::getName)
                                .orElse(null),
            user.getEmail(),
            user.getPhone(),
            departmentRepository    .findById(
                                        user.getDepartmentId()
                                    )
                                    .map(Department::getName)
                                    .orElse(null),
            teamRepository  .findById(
                                user.getTeamId()
                            )
                            .map(Team::getName)
                            .orElse(null),
            roleRepository  .findById(user.getRoleId())
                            .map(Role::getName)
                            .orElse(null),
            user.getHireDate(),
            user.getSalary(),
            currencyRepository  .findById(user.getCurrencyId())
                                .map(Currency::getName)
                                .orElse(null),
            languageRepository  .findById((user.getFirstLanguageId()))
                                .map(Language::getName)
                                .orElse(null),
            user.getSecondLanguageId()  != null
                                        ? languageRepository    .findById(
                                                                    user.getSecondLanguageId()
                                                                )
                                                                .map(Language::getName)
                                                                .orElse(null)
                                        : null,
            user.getThirdLanguageId()   != null
                                        ? languageRepository    .findById(
                                                                    user.getThirdLanguageId()
                                                                )
                                                                .map(Language::getName)
                                                                .orElse(null)
                                        : null,
            nationalityRepository   .findById(user.getFirstNationalityId())
                                    .map(Nationality::getName)
                                    .orElse(null),
            user.getSecondNationalityId()   != null
                                            ? nationalityRepository .findById(
                                                                        user.getSecondNationalityId()
                                                                    )
                                                                    .map(Nationality::getName)
                                                                    .orElse(null)
                                            : null,
            user.getStatus(),
            user.getIcon(),
            user.getDescription(),
            user.getCreatedAt(),
            user.getUpdatedAt()
        );
    }
}