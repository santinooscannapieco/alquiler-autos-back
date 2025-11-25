package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.dh.AlquilerAutosMVC.dto.CategoryDTO;
import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.exception.service.ICategoryService;
import com.dh.AlquilerAutosMVC.repository.ICarRepository;
import com.dh.AlquilerAutosMVC.repository.ICategoryRepository;
import com.dh.AlquilerAutosMVC.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CategoryService implements ICategoryService {

    private final ICategoryRepository categoryRepository;
    private final ICarRepository carRepository;

    @Autowired
    public CategoryService(ICategoryRepository categoryRepository, ICarRepository carRepository) {
        this.categoryRepository = categoryRepository;
        this.carRepository = carRepository;
    }

    @Override
    public CategoryDTO save(CategoryDTO categoryDTO) throws ResourceNotFoundException {
        Category category = new Category();
        category.setName(categoryDTO.getName());

        List<Car> carList = getCarsFromIds(categoryDTO.getCarsId());
        category.setCars(carList);

        categoryRepository.save(category);

        return category.toDTO();
    }

    @Override
    public CategoryDTO update(CategoryDTO categoryDTO) throws ResourceNotFoundException {
        Category category = categoryRepository.findById(categoryDTO.getId())
                .orElseThrow(() -> new ResourceNotFoundException("No se encontró la categoría con ID: " + categoryDTO.getId()));

        category.setName(categoryDTO.getName());

        List<Car> carList = getCarsFromIds(categoryDTO.getCarsId());
        category.setCars(carList);

        categoryRepository.save(category);

        return category.toDTO();
    }

    private List<Car> getCarsFromIds(List<Long> carIds) throws ResourceNotFoundException {
        List<Car> carList = new ArrayList<>();

        for (Long id : carIds) {
            Car car = carRepository.findById(id)
                    .orElseThrow(() -> new ResourceNotFoundException("No se encontró el auto con ID: " + id));
            carList.add(car);
        }

        return carList;
    }

    @Override
    public void delete(Long id) throws RuntimeException {
        Optional<Category> categoryToLookFor = categoryRepository.findById(id);

        if (!categoryToLookFor.isPresent()) {
            // Si no existe ninguna categoría con ese id
            throw new RuntimeException("No se eliminó ya que no se encontró una categoría con el id: " + id);
        }
        else if (!categoryToLookFor.get().getCars().isEmpty()) {
            // Si la categoría no está vacía
            throw new RuntimeException("No se puede eliminar la categoría porque tiene " + categoryToLookFor.get().getCars().size() + " autos asocioados");
        }

        categoryRepository.deleteById(id);
    }

    @Override
    public Optional<CategoryDTO> findById(Long id) throws ResourceNotFoundException {

        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Auto no encontrado"));
        return Optional.of(category.toDTO());
    }

    @Override
    public List<CategoryDTO> findAll() {

        return categoryRepository.findAll().stream()
                .map(Category::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public Optional<CategoryDTO> findByName(String name) throws ResourceNotFoundException {
        Optional<Category> categoryToLookFor = categoryRepository.findByName(name);

        if (categoryToLookFor.isPresent()) {
            Category category = categoryToLookFor.get();

            CategoryDTO categoryDTOToReturn = new CategoryDTO();
            categoryDTOToReturn.setId(category.getId());
            categoryDTOToReturn.setName(category.getName());


            List<Long> cars_id_ToReturn = new ArrayList<>();
            for (Car car : category.getCars()) {
                cars_id_ToReturn.add(car.getId());
            }
            categoryDTOToReturn.setCarsId(cars_id_ToReturn);

            return Optional.of(categoryDTOToReturn);
        }
        return Optional.empty();




        /*else {
            throw new ResourceNotFoundException("No se encontró categoría con el nombre: " + name);
        }*/
    }
}
