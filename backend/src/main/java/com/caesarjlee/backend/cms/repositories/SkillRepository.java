package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SkillRepository extends JpaRepository <Skill, Long>{
    Optional <Skill> findByName(String name);
    boolean existsByName(String name);
}