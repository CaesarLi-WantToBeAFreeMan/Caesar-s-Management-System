package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.UserSkill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserSkillRepository extends JpaRepository <UserSkill, Long>{
    List <UserSkill> findByUserId(Long userId);
    List <UserSkill> findBySkillId(Long skillId);
    boolean existsByUserIdAndSkillId(Long userId, Long skillId);
}