package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Request;
import com.caesarjlee.backend.cms.models.enumerations.RequestStatus;
import com.caesarjlee.backend.cms.models.enumerations.RequestType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository <Request, Long>{
    Page <Request> findByUserId(Long userId, Pageable pageable);
    Page <Request> findByHandlerId(Long handlerId, Pageable pageable);
    List <Request> findByRequestType(RequestType requestType);
    List <Request> findByRequestStatus(RequestStatus requestStatus);
}