package dk.binfo.repositories;

import dk.binfo.models.Apartment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("apartmentRepository")
public interface ApartmentRepository extends JpaRepository<Apartment, Integer> {
   Apartment findApartmentByNumber(String number); //Denne bliver ikke brugt. ikke fjern den
}



/*
In the early days you now had to create a DAO class which has methods for creating, updating,
deleting and reading data from the table. With Spring Data on the other hand all you need is
an interface that extends another interface. For example:

 So in this case we created an interface called ApartmentRepository, extending Spring’s
 JpaRepository, providing some generics for the entity and the type of the ID, being
 Apartment and Long. The reason we have these generics is so the return type and parameter
 types of the methods can be determined. For example, the findOne() method should accept a
 parameter of type Long and should return an entity of type Apartment.

 */