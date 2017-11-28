package dk.binfo.services;

import dk.binfo.models.Apartment;
import dk.binfo.repositories.ApartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("apartmentService")
public class ApartmentImpl implements ApartmentService {

    @Autowired
    private ApartmentRepository apartmentRepository;


    @Override //Denne bliver ikke brugt. ikke fjern den
    public Apartment findApartmentByNumber(String number) {

        return apartmentRepository.findApartmentByNumber(number);
    }

    @Override
    public void saveApartment(Apartment apartment) {
        apartmentRepository.save(apartment);
    }

    @Override
    @Transactional
    public Apartment findById(int id) {
        return apartmentRepository.findOne(id);
    }

    @Override
    @Transactional
    public Apartment delete(int id) {
        Apartment deletedApartment = apartmentRepository.findOne(id);

        apartmentRepository.delete(deletedApartment);
        return deletedApartment;
    }

    @Override
    @Transactional
    public List<Apartment> findAll() {
        return apartmentRepository.findAll();
    }

    @Override
    @Transactional()
    public Apartment update(Apartment apartment){
        Apartment updateApartment = apartmentRepository.findOne(apartment.getId());

        updateApartment.setAddress(apartment.getAddress());
        updateApartment.setNumber(apartment.getNumber());
        updateApartment.setRooms(apartment.getRooms());
        updateApartment.setGarden(apartment.isGarden());
        updateApartment.setSize(apartment.getSize());
        updateApartment.setFloor(apartment.getFloor());
        updateApartment.setFloors(apartment.getFloors());
        return updateApartment;
    }
}
