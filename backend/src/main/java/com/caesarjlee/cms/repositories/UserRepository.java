package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

public interface UserRepository extends JpaRepository <User, Long>{
    //authentication
    @Query("SELECT u FROM User u WHERE u.username = :login OR u.email = :login OR u.phone = :login")
    Optional <User> findByUsernameOrEmailOrPhone(String login);
    Optional <User> findByUsername(String username);
    Boolean existsByUsername(String username);
    Optional <User> findByEmail(String email);
    Boolean existsByEmail(String email);
    Optional <User> findByPhone(String phone);
    Boolean existsByPhone(String phone);

    //names
    Page <User> findByFirstName(String firstName, Pageable pageable);
    Page <User> findByLastName(String lastName, Pageable pageable);
    Boolean existsByFirstName(String firstName);
    Boolean existsByLastName(String lastName);
    Long countByFirstName(String firstName);
    Long countByLastName(String lastName);

    //gender
    Page <User> findByGenderId(Integer genderId, Pageable pageable);
    Boolean existsByGenderId(Integer genderId);
    Long countByGenderId(Integer genderId);

    //diploma
    Page <User> findByDiplomaId(Integer diplomaId, Pageable pageable);
    Boolean existsByDiplomaId(Integer diplomaId);
    Long countByDiplomaId(Integer diplomaId);

    //positions
    Page <User> findByDepartmentId(Integer departmentId, Pageable pageable);
    Page <User> findByTeamId(Integer teamId, Pageable pageable);
    Page <User> findByRoleId(Integer roleId, Pageable pageable);
    Boolean existsByDepartmentId(Integer departmentId);
    Boolean existsByTeamId(Integer teamId);
    Boolean existsByRoleId(Integer roleId);
    Long countByDepartmentId(Integer departmentId);
    Long countByTeamId(Integer teamId);
    Long countByRoleId(Integer roleId);

    //hire date
    Page <User> findByHireDateBetween(LocalDate start, LocalDate end, Pageable pageable);
    Boolean existsByHireDateBetween(LocalDate start, LocalDate end);
    Long countByHireDateBetween(LocalDate start, LocalDate end);

    //salary
    Page <User> findBySalaryBetween(BigDecimal min, BigDecimal max, Pageable pageable);
    Boolean existsBySalaryBetween(BigDecimal min, BigDecimal max);
    Long countBySalaryBetween(BigDecimal min, BigDecimal max);

    //currency
    Page <User> findByCurrencyId(Integer currencyId, Pageable pageable);
    Boolean existsByCurrencyId(Integer currencyId);
    Long countByCurrencyId(Integer currencyId);

    //languages
    Page <User> findByFirstLanguageId(Integer firstLanguageId, Pageable pageable);
    Page <User> findBySecondLanguageId(Integer secondLanguageId, Pageable pageable);
    Page <User> findByThirdLanguageId(Integer thirdLanguageId, Pageable pageable);
    @Query("SELECT u FROM User u WHERE u.firstLanguageId = :languageId OR u.secondLanguageId = :languageId OR u.thirdLanguageId = :languageId")
    Page <User> findByUserLanguage(Integer languageId, Pageable pageable);
    Boolean existsByFirstLanguageId(Integer firstLanguageId);
    Boolean existsBySecondLanguageId(Integer secondLanguageId);
    Boolean existsByThirdLanguageId(Integer thirdLanguageId);
    Long countByFirstLanguageId(Integer firstLanguageId);
    Long countBySecondLanguageId(Integer secondLanguageId);
    Long countByThirdLanguageId(Integer thirdLanguageId);

    //nationalities
    Page <User> findByFirstNationalityId(Integer firstNationalityId, Pageable pageable);
    Page <User> findBySecondNationalityId(Integer secondNationalityId, Pageable pageable);
    @Query("SELECT u FROM User u WHERE u.firstNationalityId = :nationalityId OR u.secondNationalityId = :nationalityId")
    Page <User> findByNationalityId(Integer nationalityId, Pageable pageable);
    Boolean existsByFirstNationalityId(Integer firstNationalityId);
    Boolean existsBySecondNationalityId(Integer secondNationalityId);
    Long countByFirstNationalityId(Integer firstNationalityId);
    Long countBySecondNationalityId(Integer secondNationalityId);

    //status
    Page <User> findByStatus(Boolean status, Pageable pageable);
    Boolean existsByStatus(Boolean status);
    Long countByStatus(Boolean status);

    //created time
    Page <User> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);
    Boolean existsByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    Long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);

    //updated time
    Page <User> findByUpdatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);
    Boolean existsByUpdatedAtBetween(LocalDateTime start, LocalDateTime end);
    Long countByUpdatedAtBetween(LocalDateTime start, LocalDateTime end);
}