package dk.binfo.controllers;

import dk.binfo.models.Apartment;
import dk.binfo.repositories.ApartmentRepository;
import dk.binfo.services.ApartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import dk.binfo.models.User;
import dk.binfo.services.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.validation.Valid;

@Controller // This means that this class is a Controller
public class ApartmentController {

    @Autowired
    private ApartmentRepository repository; // Kan vi fjerne den en af de to ApartmentRepository for at implementere Autowired?

    @Autowired
    private UserService userService;

    @Autowired
    private ApartmentService apartmentService;

    @RequestMapping("/apartment") // This means URL's start with /demo (after Application path)
    public ModelAndView showApartment() {
        ModelAndView modelAndView = new ModelAndView("/apartment", "apartment", repository.findAll());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject(user);
        modelAndView.addObject("adminMessage","Du er logget ind som spadmin");
        modelAndView.addObject("userMessage","U R USER");
        modelAndView.setViewName("/apartment");

        return modelAndView;
    }

    @RequestMapping(value = "/apartment/add", method = RequestMethod.POST)
    public ModelAndView createNewApartment(@Valid Apartment apartment, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
       /* Apartment apartmentExists = apartmentService.findApartmentByNumber(apartment.getNumber());
        if (apartmentExists != null) {
            bindingResult.rejectValue("number", "error.apartment", "Der findes allerede en lejlighed med det nummer du har angivet");
        } */
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("/apartment/add");
        } else {
            apartmentService.saveApartment(apartment);
            modelAndView.addObject("successMessage", "Fantastisk arbejde! Du har nu tilføjet en ny lejlighed. Du ROCKER!!!");
            modelAndView.addObject(user);
            modelAndView.addObject("apartment", new Apartment());
            modelAndView.setViewName("/apartment/add");

        }
        return modelAndView;
    }

    @RequestMapping("/apartment/add")
    public ModelAndView add(){
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject(user);
        modelAndView.addObject("adminMessage","Fedt man spa du er admin");
        modelAndView.addObject("userMessage","U R USER");
        modelAndView.addObject("apartment", new Apartment());
        modelAndView.setViewName("/apartment/add");
        return modelAndView;
    }

    @RequestMapping(value="/apartment/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editApartmentPage(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("/apartment/add-edit");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject(user);
        Apartment apartment = apartmentService.findById(id);
        modelAndView.addObject("apartment", apartment);
        return modelAndView;
    }

    @RequestMapping(value="/apartment/edit/{id}", method=RequestMethod.POST)
    public ModelAndView editApartment(@ModelAttribute @Valid Apartment apartment, BindingResult bindingResult, @PathVariable Integer id){
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject(user);
       // modelAndView.addObject("apartment", new Apartment()); //TODO JEG HAR INGEN IDE PATRICK

        if (bindingResult.hasErrors())
        {
            modelAndView.setViewName("/apartment/edit");
        }

        modelAndView.setViewName("redirect:/apartment");
        apartmentService.update(apartment);
        return modelAndView;
    }

    @RequestMapping(value="/apartment/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deleteApartment(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("redirect:/apartment");
        Apartment apartment = apartmentService.delete(id);
        return modelAndView;
    }
}

/*
Now the final piece of code is to write a controller that retrieves all entities and returns a ModelAndView to render those superheroes (and villains):
 */