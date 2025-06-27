package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.entity.Category;
import com.dh.AlquilerAutosMVC.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/categorias")
public class CategoryController {

    private ICategoryService iCategoryService;

    @Autowired
    public CategoryController(ICategoryService iCategoryService) {
        this.iCategoryService = iCategoryService;
    }

    @PostMapping
    public ResponseEntity<Category> save(@RequestBody Category category) {
        return ResponseEntity.ok(iCategoryService.save(category));
    }

    @PutMapping
    public ResponseEntity<String> update(@RequestBody Category category) {
        ResponseEntity<String> response;
        Optional<Category> categoryToLookFor = iCategoryService.findById(category.getId());

        if (categoryToLookFor.isPresent()) {
            iCategoryService.update(category);
            response = ResponseEntity.ok("Se actualizó la categoría con id: " + category.getId());
        } else {
            response = ResponseEntity.ok().body("No se puede actualizar una categoría que no existe dentro de la BD");
        }
        return response;
    }

    @DeleteMapping
    public ResponseEntity<String> delete(@RequestParam Long id) {
        ResponseEntity<String> response;

        if (iCategoryService.findById(id).isPresent()) {
            iCategoryService.delete(id);
            response = ResponseEntity.ok("Se eliminó la categoría con id: " + id);
        } else {
            response = ResponseEntity.ok().body("No se puede eliminar una categoría que no exist dentro dela BD");
        }
        return response;
    }

    @GetMapping
    public List<Category> findAll() {
        return iCategoryService.findAll();
    }



    /*
    @GetMapping("/{name}")
    public Category findByName(@PathVariable String name) {
        return iCategoryService.findByName(name);
    }*/
}
