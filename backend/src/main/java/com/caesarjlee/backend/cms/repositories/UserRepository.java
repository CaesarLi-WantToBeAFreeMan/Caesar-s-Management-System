package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.User;
import org.springframework.data.repository.CrudRepository;

/*
repository interface for user entity
CrudRepository <Entity, PrimaryKey> is an interface to provide basic CRUD operations:
* either `create` or `update`
    1. Entity save(Entity entity): save a given entity
    2. Iterable <Entity> saveAll(Iterable <Entity> entities): save all given entity
* `read`
    1. Optional <Entity> findById(Id id): return an entity by its id
    2. Iterable <Entity> findAllByIf(Iterable <Id> ids): return all entities with the given ids
    3. Iterable <Entity> findAll(): return all entities
* `delete`
    1. void deleteById(Id id): delete an entity by its id
    2. void deleteAllById(Iterable <? extends ID> ids): delete all entities with the given ids
    3. void delet(Entity entity): delete the given entity
    4. void deleteAll(Iterable <? extends Entity> entities): delete all enties with the given ids
    5. void deleteAll(): delete all enetities
* other
    1. long count(): return a number of eneties
    2. boolean existsbyId(Id id): return whether an entity exists by its id
Spring Data will generate these methods automatically
*/
public interface UserRepository extends CrudRepository <User, Long>{
}