package dk.binfo.services;

import dk.binfo.models.Apartment;

import java.util.List;

public interface ApartmentService {
    Apartment findApartmentByNumber(String number);

    Apartment delete(int id);
    List<Apartment> findAll(); // DDENNE KASDKASDAS DA TESTES.
    Apartment update(Apartment apartment);
    Apartment findById(int id);

    //Saves the Apartment setters.
    void saveApartment(Apartment apartment);
}
