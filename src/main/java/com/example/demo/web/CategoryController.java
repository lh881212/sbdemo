package com.example.demo.web;

import com.example.demo.dao.CategoryDAO;
import com.example.demo.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    CategoryDAO categoryDAO;

    @RequestMapping("/listCategory")
    public String listCategory(Model model,
                               @RequestParam(value="pageNo",defaultValue = "0") int pageNo,
                               @RequestParam(value="size",defaultValue = "5") int size){
        pageNo=pageNo<0?0:pageNo;
        Sort sort=Sort.by(Sort.Direction.DESC,"id");
        Pageable pageable=PageRequest.of(pageNo,size,sort);
        Page<Category> page=categoryDAO.findAll(pageable);

        System.out.println(page.getNumber());
        System.out.println(page.getNumberOfElements());
        System.out.println(page.getSize());
        System.out.println(page.getTotalElements());
        System.out.println(page.getTotalPages());

        model.addAttribute("page",page);
        return "listCategory";
    }

    @RequestMapping("/addCategory")
    public String addCategory(Category c){
        categoryDAO.save(c);
        return "redirect:listCategory";
    }

    @RequestMapping("/deleteCategory")
    public String deleteCategory(Category c)throws Exception{
        categoryDAO.delete(c);
        return "redirect:listCategory";
    }
    @RequestMapping("/updateCategory")
    public String updateCategory(Category c)throws Exception{
        categoryDAO.save(c);
        return "redirect:listCategory";
    }
    @RequestMapping("/editCategory")
    public String editCategory(int id,Model m){
        Category c=categoryDAO.getOne(id);
        m.addAttribute("c",c);
        return "editCategory";
    }
}
