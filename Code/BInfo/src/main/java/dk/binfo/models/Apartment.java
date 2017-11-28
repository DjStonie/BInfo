package dk.binfo.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "apartment")
public class Apartment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "address")
    //@NotEmpty(message = "*Du mangler lejligheds addresse")
    private String address;
    @Column(name = "number")
  //  @NotNull(message = "*Du mangler antal værelser")
    private String number;
    @Column(name = "rooms")
  //  @NotNull(message = "*Du mangler antal værelser")
    private Integer rooms;
    @Column(name = "garden")
  //  @NotNull(message = "*Du mangler lejlighed have")
    private boolean garden;
    @Column(name = "size")
  //  @NotNull(message = "*Du mangler lejlighed størrelse")
    private Integer size;
    @Column(name = "floor")
  //  @NotNull(message = "*Du mangler lejlighedens etage")
    private Integer floor;
    @Column(name = "floors")
 //   @NotNull(message = "*Du mangler at angive antal etager i lejligheden")
    private Integer floors;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getRooms() {
        return rooms;
    }

    public void setRooms(Integer rooms) {
        this.rooms = rooms;
    }

    public boolean isGarden() {
        return garden;
    }

    public void setGarden(boolean garden) {
        this.garden = garden;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getFloors() {
        return floors;
    }

    public void setFloors(Integer floors) {
        this.floors = floors;
    }
}


/*
At first sight this class is a simple POJO with some fields and getters/setters for every field except for the ID. We don’t want people to allow updating the ID, so if you leave out the setter, there is no way you can edit the field. Obviously for instantiation you’ll have to find another mechanism, being either a builder or a constructor with the possibility to add the ID. Or in this case we have an auto-generated ID, so in theory you don’t need any way to set the field, though for testing you still might want to keep a constructor or a builder.

Anyways, next to the fields themselves there are also some JPA annotations. Above the class we can find two of them, called @Entity and @Table. With the first annotation we tell JPA that this class is an entity, while with the second one you tell which table it resembles. If the table name is the same as the class name, you could leave this one away.

Now, for each field we have the @Column annotation to tell what column the field resembles. For the ID we also have the @Id annotation and the @GeneratedValue annotation which tells JPA how the ID is created.
 */