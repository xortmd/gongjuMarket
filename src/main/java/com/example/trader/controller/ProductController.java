package com.example.trader.controller;

import com.example.trader.domain.product.Product;
import com.example.trader.domain.product.ProductDto;
import com.example.trader.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class ProductController {

    @Autowired
    private ProductService service;

    // Create
    @PostMapping("/v1/write/product")
    public void writeProduct(@RequestBody ProductDto productDto) {
        service.createProduct(productDto);
    }

    @GetMapping("/productView/{p_no}")
    public ModelAndView SearchTotalPageviews(@PathVariable int p_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productView");
        modelAndView.addObject("response", getProduct(p_no));
        return modelAndView;
    }

    // GetProduct
    @GetMapping("/v1/search/product")
    public Product getProduct(@RequestParam int p_no) {
        Product product = service.readProductByP_no(p_no);
        return product;
    }

    @GetMapping("/product")
    public ModelAndView SearchTotalPageviews() throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("product");
        modelAndView.addObject("response", getProductAll());
        return modelAndView;
    }

    // GetProductAll
    @GetMapping("/v1/search/productAll")
    public List<Product> getProductAll() {
        return service.readProductAll();
    }

    // GetProductByCategory
    @GetMapping("/v1/search/product/category")
    public List<Product> getProductByCategory(@RequestParam String category) {
        return service.searchProductByCategory(category);
    }

    // UpdateProduct
    @PostMapping("/v1/update/product")
    public void updateProduct(@RequestBody ProductDto productDto) {
        service.updateProduct(productDto);
    }

    // DeleteProduct
    @DeleteMapping("/v1/delete/product")
    public void deleteProduct(@RequestParam int p_no) {
        service.deleteProduct(p_no);
    }

}
