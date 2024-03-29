// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import net.eyelock.sakila.domain.Payment;
import net.eyelock.sakila.services.CustomerService;
import net.eyelock.sakila.services.PaymentService;
import net.eyelock.sakila.services.RentalService;
import net.eyelock.sakila.services.StaffService;
import net.eyelock.sakila.web.PaymentController;
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

privileged aspect PaymentController_Roo_Controller {
    
    @Autowired
    PaymentService PaymentController.paymentService;
    
    @Autowired
    CustomerService PaymentController.customerService;
    
    @Autowired
    RentalService PaymentController.rentalService;
    
    @Autowired
    StaffService PaymentController.staffService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PaymentController.create(@Valid Payment payment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, payment);
            return "payments/create";
        }
        uiModel.asMap().clear();
        paymentService.savePayment(payment);
        return "redirect:/payments/" + encodeUrlPathSegment(payment.getPaymentId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PaymentController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Payment());
        return "payments/create";
    }
    
    @RequestMapping(value = "/{paymentId}", produces = "text/html")
    public String PaymentController.show(@PathVariable("paymentId") Short paymentId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("payment", paymentService.findPayment(paymentId));
        uiModel.addAttribute("itemId", paymentId);
        return "payments/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PaymentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("payments", paymentService.findPaymentEntries(firstResult, sizeNo));
            float nrOfPages = (float) paymentService.countAllPayments() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("payments", paymentService.findAllPayments());
        }
        addDateTimeFormatPatterns(uiModel);
        return "payments/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PaymentController.update(@Valid Payment payment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, payment);
            return "payments/update";
        }
        uiModel.asMap().clear();
        paymentService.updatePayment(payment);
        return "redirect:/payments/" + encodeUrlPathSegment(payment.getPaymentId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{paymentId}", params = "form", produces = "text/html")
    public String PaymentController.updateForm(@PathVariable("paymentId") Short paymentId, Model uiModel) {
        populateEditForm(uiModel, paymentService.findPayment(paymentId));
        return "payments/update";
    }
    
    @RequestMapping(value = "/{paymentId}", method = RequestMethod.DELETE, produces = "text/html")
    public String PaymentController.delete(@PathVariable("paymentId") Short paymentId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Payment payment = paymentService.findPayment(paymentId);
        paymentService.deletePayment(payment);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/payments";
    }
    
    void PaymentController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("payment_paymentdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("payment_lastupdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void PaymentController.populateEditForm(Model uiModel, Payment payment) {
        uiModel.addAttribute("payment", payment);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("customers", customerService.findAllCustomers());
        uiModel.addAttribute("rentals", rentalService.findAllRentals());
        uiModel.addAttribute("staffs", staffService.findAllStaffs());
    }
    
    String PaymentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
