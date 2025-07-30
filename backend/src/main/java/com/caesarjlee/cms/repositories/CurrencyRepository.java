package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Currency;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CurrencyRepository extends JpaRepository <Currency, Integer>{
    Currency findByAbbreviation(String abbreviation);
    Currency findByName(String name);

    boolean existsByAbbreviation(String abbreviation);
    boolean existsByName(String name);
}