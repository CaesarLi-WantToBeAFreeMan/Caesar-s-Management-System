package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Currency;
import com.caesarjlee.cms.models.Gender;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenderRepository extends JpaRepository <Gender, Integer>{
    Currency findByName(String name);

    boolean existsByName(String name);
}