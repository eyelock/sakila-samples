// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.services.CategoryService;
import net.eyelock.sakila.web.CategoryController;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CategoryController_Roo_Controller {
    
    @Autowired
    CategoryService CategoryController.categoryService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CategoryController.create(@Valid Category category, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, category);
            return "categories/create";
        }
        uiModel.asMap().clear();
        categoryService.saveCategory(category);
        return "redirect:/categories/" + encodeUrlPathSegment(category.getCategoryId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CategoryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Category());
        return "categories/create";
    }
    
    @RequestMapping(value = "/{categoryId}", produces = "text/html")
    public String CategoryController.show(@PathVariable("categoryId") Short categoryId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("category", categoryService.findCategory(categoryId));
        uiModel.addAttribute("itemId", categoryId);
        return "categories/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CategoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("categorys", categoryService.findCategoryEntries(firstResult, sizeNo));
            float nrOfPages = (float) categoryService.countAllCategorys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("categorys", categoryService.findAllCategorys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "categories/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CategoryController.update(@Valid Category category, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, category);
            return "categories/update";
        }
        uiModel.asMap().clear();
        categoryService.updateCategory(category);
        return "redirect:/categories/" + encodeUrlPathSegment(category.getCategoryId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{categoryId}", params = "form", produces = "text/html")
    public String CategoryController.updateForm(@PathVariable("categoryId") Short categoryId, Model uiModel) {
        populateEditForm(uiModel, categoryService.findCategory(categoryId));
        return "categories/update";
    }
    
    @RequestMapping(value = "/{categoryId}", method = RequestMethod.DELETE, produces = "text/html")
    public String CategoryController.delete(@PathVariable("categoryId") Short categoryId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Category category = categoryService.findCategory(categoryId);
        categoryService.deleteCategory(category);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/categories";
    }
    
    void CategoryController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("category_lastupdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void CategoryController.populateEditForm(Model uiModel, Category category) {
        uiModel.addAttribute("category", category);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("filmcategorys", filmCategoryService.findAllFilmCategorys());
    }
    
    String CategoryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
